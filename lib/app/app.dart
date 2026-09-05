import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class IdosoConectadoApp extends StatelessWidget {
  const IdosoConectadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idoso Conectado',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}