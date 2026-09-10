import 'package:flutter/material.dart';

import 'app/app.dart';
import 'services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationService = NotificationService();

  await notificationService.inicializar();
  await notificationService.solicitarPermissao();

  runApp(const IdosoConectadoApp());
}