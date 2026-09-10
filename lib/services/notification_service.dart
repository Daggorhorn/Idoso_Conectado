import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance =
      NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _inicializado = false;

  // ============================================================
  // CANAL DE NOTIFICAÇÕES
  // ============================================================

  static const String _channelId = 'lembretes_medicamentos';

  static const String _channelName = 'Lembretes de medicamentos';

  static const String _channelDescription =
      'Notificações e alarmes para lembrar o usuário '
      'de tomar seus medicamentos.';

  // ============================================================
  // INICIALIZAÇÃO
  // ============================================================

  Future<void> inicializar() async {
    if (_inicializado) {
      debugPrint(
        '🔔 [NOTIF] Serviço já inicializado.',
      );
      return;
    }

    debugPrint(
      '🔔 [NOTIF] Iniciando serviço...',
    );

    try {
      // ----------------------------------------------------------
      // TIMEZONE
      // ----------------------------------------------------------

      tz.initializeTimeZones();

      final timezoneInfo =
          await FlutterTimezone.getLocalTimezone();

      final timezoneName = timezoneInfo.identifier;

      debugPrint(
        '🌎 [NOTIF] Fuso horário do dispositivo: '
        '$timezoneName',
      );

      final location = tz.getLocation(
        timezoneName,
      );

      tz.setLocalLocation(
        location,
      );

      debugPrint(
        '🌎 [NOTIF] Fuso horário configurado: '
        '${tz.local.name}',
      );

      // ----------------------------------------------------------
      // CONFIGURAÇÃO ANDROID
      // ----------------------------------------------------------

      const androidSettings =
          AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );

      const initializationSettings =
          InitializationSettings(
        android: androidSettings,
      );

      // ----------------------------------------------------------
      // INICIALIZAÇÃO DO PLUGIN
      // ----------------------------------------------------------

      final resultado =
          await _notifications.initialize(
        settings: initializationSettings,
      );

      debugPrint(
        '🔔 [NOTIF] Inicialização concluída: '
        '$resultado',
      );

      _inicializado = resultado ?? true;
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro na inicialização: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // PERMISSÕES
  // ============================================================

  Future<void> solicitarPermissao() async {
    debugPrint(
      '🔔 [NOTIF] Solicitando permissões...',
    );

    try {
      final androidImplementation =
          _notifications
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>();

      if (androidImplementation == null) {
        debugPrint(
          '⚠️ [NOTIF] Implementação Android não encontrada.',
        );

        return;
      }

      // ----------------------------------------------------------
      // NOTIFICAÇÕES
      // ----------------------------------------------------------

      final permissaoNotificacao =
          await androidImplementation
              .requestNotificationsPermission();

      debugPrint(
        '🔔 [NOTIF] Permissão de notificação: '
        '$permissaoNotificacao',
      );

      // ----------------------------------------------------------
      // ALARMES EXATOS
      // ----------------------------------------------------------

      final permissaoAlarme =
          await androidImplementation
              .requestExactAlarmsPermission();

      debugPrint(
        '⏰ [NOTIF] Permissão de alarme exato: '
        '$permissaoAlarme',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro ao solicitar permissões: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // DETALHES PADRÃO DA NOTIFICAÇÃO
  // ============================================================

  NotificationDetails _detalhesNotificacao() {
    const androidDetails =
        AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,

      // Importância máxima para lembretes importantes.
      importance: Importance.max,

      // Prioridade alta para notificações agendadas.
      priority: Priority.high,

      // Som.
      playSound: true,

      // Vibração.
      enableVibration: true,

      // Mantém a notificação até o usuário interagir.
      autoCancel: true,
    );

    return const NotificationDetails(
      android: androidDetails,
    );
  }

  // ============================================================
  // NOTIFICAÇÃO IMEDIATA
  // ============================================================

  Future<void> mostrarTesteImediato() async {
    debugPrint(
      '🔔 [NOTIF] Enviando notificação imediata...',
    );

    try {
      if (!_inicializado) {
        await inicializar();
      }

      final details =
          _detalhesNotificacao();

      await _notifications.show(
        id: 999,
        title: 'Idoso Conectado',
        body: '🔔 Teste imediato funcionando!',
        notificationDetails: details,
      );

      debugPrint(
        '✅ [NOTIF] Notificação imediata enviada!',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro na notificação imediata: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // TESTE — 30 SEGUNDOS
  // ============================================================

  Future<void> agendarTeste() async {
    debugPrint(
      '⏰ [NOTIF] Agendando teste para 30 segundos...',
    );

    try {
      if (!_inicializado) {
        debugPrint(
          '⚠️ [NOTIF] Serviço ainda não inicializado.',
        );

        await inicializar();
      }

      final agora =
          tz.TZDateTime.now(
        tz.local,
      );

      final horario =
          agora.add(
        const Duration(
          seconds: 30,
        ),
      );

      debugPrint(
        '🌎 [NOTIF] Timezone atual: '
        '${tz.local.name}',
      );

      debugPrint(
        '🕐 [NOTIF] Agora: '
        '$agora',
      );

      debugPrint(
        '🕐 [NOTIF] Agendado: '
        '$horario',
      );

      await _notifications.zonedSchedule(
        id: 1000,
        title: 'Idoso Conectado',
        body: '🔔 Lembrete de teste funcionando!',
        scheduledDate: horario,
        notificationDetails:
            _detalhesNotificacao(),
        androidScheduleMode:
            AndroidScheduleMode.exactAllowWhileIdle,
      );

      debugPrint(
        '✅ [NOTIF] Notificação de teste '
        'agendada com sucesso!',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] ERRO AO AGENDAR TESTE: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // AGENDAR MEDICAMENTO
  // ============================================================

  Future<void> agendarMedicamento({
    required int id,
    required String nomeMedicamento,
    required String horario,
  }) async {
    debugPrint(
      '💊 [NOTIF] Agendando medicamento...',
    );

    try {
      if (!_inicializado) {
        await inicializar();
      }

      // ----------------------------------------------------------
      // CONVERTE "HH:mm" PARA HORÁRIO
      // ----------------------------------------------------------

      final partes =
          horario.split(':');

      if (partes.length != 2) {
        throw FormatException(
          'Horário inválido: $horario',
        );
      }

      final hora =
          int.parse(partes[0]);

      final minuto =
          int.parse(partes[1]);

      if (hora < 0 ||
          hora > 23 ||
          minuto < 0 ||
          minuto > 59) {
        throw FormatException(
          'Horário inválido: $horario',
        );
      }

      // ----------------------------------------------------------
      // HORÁRIO ATUAL
      // ----------------------------------------------------------

      final agora =
          tz.TZDateTime.now(
        tz.local,
      );

      // ----------------------------------------------------------
      // PRÓXIMA OCORRÊNCIA
      // ----------------------------------------------------------

      var dataAgendamento =
          tz.TZDateTime(
        tz.local,
        agora.year,
        agora.month,
        agora.day,
        hora,
        minuto,
      );

      // Se o horário de hoje já passou,
      // agenda para amanhã.
      if (!dataAgendamento.isAfter(agora)) {
        dataAgendamento =
            dataAgendamento.add(
          const Duration(
            days: 1,
          ),
        );
      }

      debugPrint(
        '💊 [NOTIF] Medicamento: '
        '$nomeMedicamento',
      );

      debugPrint(
        '🕐 [NOTIF] Horário informado: '
        '$horario',
      );

      debugPrint(
        '🕐 [NOTIF] Agendado para: '
        '$dataAgendamento',
      );

      // ----------------------------------------------------------
      // AGENDA
      // ----------------------------------------------------------

      await _notifications.zonedSchedule(
        id: id,
        title: '💊 Hora do medicamento',
        body:
            'Está na hora de tomar '
            '$nomeMedicamento.',
        scheduledDate: dataAgendamento,
        notificationDetails:
            _detalhesNotificacao(),
        androidScheduleMode:
            AndroidScheduleMode.exactAllowWhileIdle,
      );

      debugPrint(
        '✅ [NOTIF] Medicamento agendado com sucesso!',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro ao agendar medicamento: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // AGENDAR MEDICAMENTO DIARIAMENTE
  // ============================================================

  Future<void> agendarMedicamentoDiario({
    required int id,
    required String nomeMedicamento,
    required String horario,
  }) async {
    debugPrint(
      '🔄 [NOTIF] Criando lembrete diário...',
    );

    try {
      if (!_inicializado) {
        await inicializar();
      }

      final partes =
          horario.split(':');

      if (partes.length != 2) {
        throw FormatException(
          'Horário inválido: $horario',
        );
      }

      final hora =
          int.parse(partes[0]);

      final minuto =
          int.parse(partes[1]);

      if (hora < 0 ||
          hora > 23 ||
          minuto < 0 ||
          minuto > 59) {
        throw FormatException(
          'Horário inválido: $horario',
        );
      }

      final agora =
          tz.TZDateTime.now(
        tz.local,
      );

      var primeiroHorario =
          tz.TZDateTime(
        tz.local,
        agora.year,
        agora.month,
        agora.day,
        hora,
        minuto,
      );

      if (!primeiroHorario.isAfter(agora)) {
        primeiroHorario =
            primeiroHorario.add(
          const Duration(
            days: 1,
          ),
        );
      }

      debugPrint(
        '💊 [NOTIF] Medicamento: '
        '$nomeMedicamento',
      );

      debugPrint(
        '🕐 [NOTIF] Horário diário: '
        '$horario',
      );

      debugPrint(
        '🕐 [NOTIF] Primeira ocorrência: '
        '$primeiroHorario',
      );

      await _notifications.zonedSchedule(
        id: id,
        title: '💊 Hora do medicamento',
        body:
            'Está na hora de tomar '
            '$nomeMedicamento.',
        scheduledDate: primeiroHorario,
        notificationDetails:
            _detalhesNotificacao(),
        androidScheduleMode:
            AndroidScheduleMode.exactAllowWhileIdle,

        // A partir da versão atual do plugin,
        // usamos a periodicidade para o lembrete diário.
        matchDateTimeComponents:
            DateTimeComponents.time,
      );

      debugPrint(
        '✅ [NOTIF] Lembrete diário criado!',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro ao criar lembrete diário: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // CANCELAR UMA NOTIFICAÇÃO
  // ============================================================

  Future<void> cancelar(int id) async {
    try {
      await _notifications.cancel(
        id: id,
      );

      debugPrint(
        '🗑️ [NOTIF] Notificação $id cancelada.',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro ao cancelar $id: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // CANCELAR TODAS
  // ============================================================

  Future<void> cancelarTodas() async {
    try {
      await _notifications.cancelAll();

      debugPrint(
        '🗑️ [NOTIF] Todas as notificações foram canceladas.',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro ao cancelar notificações: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // LISTAR NOTIFICAÇÕES PENDENTES
  // ============================================================

  Future<void> listarPendentes() async {
    try {
      final pendentes =
          await _notifications
              .pendingNotificationRequests();

      debugPrint(
        '📋 [NOTIF] Notificações pendentes: '
        '${pendentes.length}',
      );

      for (final notificacao in pendentes) {
        debugPrint(
          '   → ID: ${notificacao.id}',
        );

        debugPrint(
          '   → Título: ${notificacao.title}',
        );

        debugPrint(
          '   → Corpo: ${notificacao.body}',
        );
      }
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro ao consultar pendentes: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  // ============================================================
  // VERIFICAR SE ESTÁ INICIALIZADO
  // ============================================================

  bool get inicializado =>
      _inicializado;
}