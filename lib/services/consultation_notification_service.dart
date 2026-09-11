import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class ConsultationNotificationService {
  final FlutterLocalNotificationsPlugin notifications;
  final NotificationDetails Function() detalhesNotificacao;

  ConsultationNotificationService({
    required this.notifications,
    required this.detalhesNotificacao,
  });

  Future<void> agendarConsulta({
    required int id,
    required String medico,
    required String local,
    required DateTime dataHora,
  }) async {
    debugPrint(
      '🏥 [NOTIF] Agendando lembretes da consulta...',
    );

    try {
      final base =
          id.abs().remainder(500000000);

      final idUmDiaAntes =
          1000000000 + (base * 2);

      final idUmaHoraAntes =
          idUmDiaAntes + 1;

      final dataHoraConsulta =
          tz.TZDateTime.from(
        dataHora,
        tz.local,
      );

      final agora =
          tz.TZDateTime.now(
        tz.local,
      );

      final umDiaAntes =
          dataHoraConsulta.subtract(
        const Duration(days: 1),
      );

      final umaHoraAntes =
          dataHoraConsulta.subtract(
        const Duration(hours: 1),
      );

      debugPrint(
        '🏥 [NOTIF] Médico: $medico',
      );

      debugPrint(
        '📍 [NOTIF] Local: '
        '${local.isEmpty ? 'Não informado' : local}',
      );

      debugPrint(
        '🕐 [NOTIF] Consulta: '
        '$dataHoraConsulta',
      );

      debugPrint(
        '🔔 [NOTIF] Lembrete de 1 dia antes: '
        '$umDiaAntes',
      );

      debugPrint(
        '🔔 [NOTIF] Lembrete de 1 hora antes: '
        '$umaHoraAntes',
      );

      debugPrint(
        '🆔 [NOTIF] ID da consulta: $id',
      );

      debugPrint(
        '🆔 [NOTIF] ID notificação 1 dia: '
        '$idUmDiaAntes',
      );

      debugPrint(
        '🆔 [NOTIF] ID notificação 1 hora: '
        '$idUmaHoraAntes',
      );

      final localTexto =
          local.trim().isEmpty
              ? ''
              : ' Local: $local.';

      if (umDiaAntes.isAfter(agora)) {
        await notifications.zonedSchedule(
          id: idUmDiaAntes,
          title: '🏥 Consulta amanhã',
          body:
              'Você tem uma consulta amanhã '
              'às ${_formatarHora(dataHoraConsulta)} '
              'com $medico.$localTexto',
          scheduledDate: umDiaAntes,
          notificationDetails:
              detalhesNotificacao(),
          androidScheduleMode:
              AndroidScheduleMode.exactAllowWhileIdle,
        );

        debugPrint(
          '✅ [NOTIF] Lembrete de 1 dia '
          'agendado.',
        );
      } else {
        debugPrint(
          '⚠️ [NOTIF] Lembrete de 1 dia '
          'não foi agendado porque já passou.',
        );
      }

      if (umaHoraAntes.isAfter(agora)) {
        await notifications.zonedSchedule(
          id: idUmaHoraAntes,
          title: '🏥 Consulta em 1 hora',
          body:
              'Sua consulta com $medico '
              'será daqui a 1 hora '
              '(${_formatarHora(dataHoraConsulta)}).'
              '$localTexto',
          scheduledDate: umaHoraAntes,
          notificationDetails:
              detalhesNotificacao(),
          androidScheduleMode:
              AndroidScheduleMode.exactAllowWhileIdle,
        );

        debugPrint(
          '✅ [NOTIF] Lembrete de 1 hora '
          'agendado.',
        );
      } else {
        debugPrint(
          '⚠️ [NOTIF] Lembrete de 1 hora '
          'não foi agendado porque já passou.',
        );
      }

      debugPrint(
        '📋 [NOTIF] Verificando notificações pendentes...',
      );

      final pendentes =
          await notifications
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

      debugPrint(
        '✅ [NOTIF] Lembretes da consulta '
        'processados com sucesso!',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro ao agendar consulta: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  Future<void> cancelarConsulta(int id) async {
    debugPrint(
      '🗑️ [NOTIF] Cancelando lembretes da consulta $id...',
    );

    try {
      final base =
          id.abs().remainder(500000000);

      final idUmDiaAntes =
          1000000000 + (base * 2);

      final idUmaHoraAntes =
          idUmDiaAntes + 1;

      await notifications.cancel(
        id: idUmDiaAntes,
      );

      await notifications.cancel(
        id: idUmaHoraAntes,
      );

      debugPrint(
        '✅ [NOTIF] Lembretes da consulta '
        '$id cancelados.',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ [NOTIF] Erro ao cancelar consulta $id: $e',
      );

      debugPrint(
        '$stackTrace',
      );
    }
  }

  String _formatarHora(
    DateTime dataHora,
  ) {
    final hora =
        dataHora.hour
            .toString()
            .padLeft(2, '0');

    final minuto =
        dataHora.minute
            .toString()
            .padLeft(2, '0');

    return '$hora:$minuto';
  }
}