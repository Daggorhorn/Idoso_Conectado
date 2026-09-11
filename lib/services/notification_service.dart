import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'medication_notification_service.dart';
import 'consultation_notification_service.dart';

class NotificationService {
  static final NotificationService _instance =
      NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  late final MedicationNotificationService
      _medicationNotificationService;

  bool _inicializado = false;

  late final ConsultationNotificationService
    _consultationNotificationService;

  static const String _channelId =
      'lembretes_medicamentos';

  static const String _channelName =
      'Lembretes do Idoso Conectado';

  static const String _channelDescription =
      'Notificações e alarmes para lembrar o usuário '
      'de tomar seus medicamentos e comparecer às consultas.';

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
      tz.initializeTimeZones();

      final timezoneInfo =
          await FlutterTimezone.getLocalTimezone();

      final timezoneName =
          timezoneInfo.identifier;

      debugPrint(
        '🌎 [NOTIF] Fuso horário do dispositivo: '
        '$timezoneName',
      );

      final location =
          tz.getLocation(timezoneName);

      tz.setLocalLocation(location);

      debugPrint(
        '🌎 [NOTIF] Fuso horário configurado: '
        '${tz.local.name}',
      );

      const androidSettings =
          AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );

      const initializationSettings =
          InitializationSettings(
        android: androidSettings,
      );

      final resultado =
          await _notifications.initialize(
        settings: initializationSettings,
      );

      debugPrint(
        '🔔 [NOTIF] Inicialização concluída: '
        '$resultado',
      );

      _inicializado =
          resultado ?? true;

      _medicationNotificationService =
          MedicationNotificationService(
        notifications: _notifications,
        detalhesNotificacao:
            _detalhesNotificacao,
      );

      _consultationNotificationService =
          ConsultationNotificationService(
        notifications: _notifications,
        detalhesNotificacao:
            _detalhesNotificacao,
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro na inicialização: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

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

      final permissaoNotificacao =
          await androidImplementation
              .requestNotificationsPermission();

      debugPrint(
        '🔔 [NOTIF] Permissão de notificação: '
        '$permissaoNotificacao',
      );

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

  NotificationDetails _detalhesNotificacao() {
    const androidDetails =
        AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription:
          _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      autoCancel: true,
    );

    return const NotificationDetails(
      android: androidDetails,
    );
  }

  Future<void> mostrarTesteImediato() async {
    debugPrint(
      '🔔 [NOTIF] Enviando notificação imediata...',
    );

    try {
      if (!_inicializado) {
        await inicializar();
      }

      await _notifications.show(
        id: 999,
        title: 'Idoso Conectado',
        body:
            '🔔 Teste imediato funcionando!',
        notificationDetails:
            _detalhesNotificacao(),
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
        body:
            '🔔 Lembrete de teste funcionando!',
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

  Future<void> agendarMedicamento({
    required int id,
    required String nomeMedicamento,
    required String horario,
  }) async {
    if (!_inicializado) {
      await inicializar();
    }

    await _medicationNotificationService
        .agendarMedicamento(
      id: id,
      nomeMedicamento: nomeMedicamento,
      horario: horario,
    );
  }

  Future<void> agendarMedicamentoDiario({
    required int id,
    required String nomeMedicamento,
    required String horario,
  }) async {
    if (!_inicializado) {
      await inicializar();
    }

    await _medicationNotificationService
        .agendarMedicamentoDiario(
      id: id,
      nomeMedicamento: nomeMedicamento,
      horario: horario,
    );
  }

  Future<void> agendarConsulta({
    required int id,
    required String medico,
    required String local,
    required DateTime dataHora,
  }) async {
    if (!_inicializado) {
      await inicializar();
    }

    await _consultationNotificationService
        .agendarConsulta(
      id: id,
      medico: medico,
      local: local,
      dataHora: dataHora,
    );
  }

  Future<void> cancelarConsulta(int id) async {
    if (!_inicializado) {
      await inicializar();
    }

    await _consultationNotificationService
        .cancelarConsulta(id);
  }

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

  bool get inicializado =>
      _inicializado;
}