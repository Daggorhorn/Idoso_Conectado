import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class MedicationNotificationService {
  final FlutterLocalNotificationsPlugin notifications;
  final NotificationDetails Function() detalhesNotificacao;

  MedicationNotificationService({
    required this.notifications,
    required this.detalhesNotificacao,
  });

  Future<void> agendarMedicamento({
    required int id,
    required String nomeMedicamento,
    required String horario,
  }) async {
    debugPrint(
      '💊 [NOTIF] Agendando medicamento...',
    );

    try {
      final partes = horario.split(':');

      if (partes.length != 2) {
        throw FormatException(
          'Horário inválido: $horario',
        );
      }

      final hora = int.parse(partes[0]);
      final minuto = int.parse(partes[1]);

      if (hora < 0 ||
          hora > 23 ||
          minuto < 0 ||
          minuto > 59) {
        throw FormatException(
          'Horário inválido: $horario',
        );
      }

      final agora = tz.TZDateTime.now(
        tz.local,
      );

      var dataAgendamento = tz.TZDateTime(
        tz.local,
        agora.year,
        agora.month,
        agora.day,
        hora,
        minuto,
      );

      if (!dataAgendamento.isAfter(agora)) {
        dataAgendamento = dataAgendamento.add(
          const Duration(days: 1),
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

      await notifications.zonedSchedule(
        id: id,
        title: '💊 Hora do medicamento',
        body:
            'Está na hora de tomar '
            '$nomeMedicamento.',
        scheduledDate: dataAgendamento,
        notificationDetails: detalhesNotificacao(),
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

  Future<void> agendarMedicamentoDiario({
    required int id,
    required String nomeMedicamento,
    required String horario,
  }) async {
    debugPrint(
      '🔄 [NOTIF] Criando lembrete diário...',
    );

    try {
      final partes = horario.split(':');

      if (partes.length != 2) {
        throw FormatException(
          'Horário inválido: $horario',
        );
      }

      final hora = int.parse(partes[0]);
      final minuto = int.parse(partes[1]);

      if (hora < 0 ||
          hora > 23 ||
          minuto < 0 ||
          minuto > 59) {
        throw FormatException(
          'Horário inválido: $horario',
        );
      }

      final agora = tz.TZDateTime.now(
        tz.local,
      );

      var primeiroHorario = tz.TZDateTime(
        tz.local,
        agora.year,
        agora.month,
        agora.day,
        hora,
        minuto,
      );

      if (!primeiroHorario.isAfter(agora)) {
        primeiroHorario = primeiroHorario.add(
          const Duration(days: 1),
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

      await notifications.zonedSchedule(
        id: id,
        title: '💊 Hora do medicamento',
        body:
            'Está na hora de tomar '
            '$nomeMedicamento.',
        scheduledDate: primeiroHorario,
        notificationDetails: detalhesNotificacao(),
        androidScheduleMode:
            AndroidScheduleMode.exactAllowWhileIdle,
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
}