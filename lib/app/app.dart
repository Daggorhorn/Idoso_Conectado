import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routes.dart';
import 'theme.dart';

class IdosoConectadoApp extends StatelessWidget {
  const IdosoConectadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idoso Conectado',
      debugShowCheckedModeBanner: false,

      locale: const Locale('pt', 'BR'),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('pt', 'BR'),
      ],

      theme: AppTheme.lightTheme,

      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}