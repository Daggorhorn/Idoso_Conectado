import 'package:flutter/material.dart';

import '../screens/emergency/emergency_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  
  static const String splash = '/';
  static const String home = '/home';
  static const String emergency = '/emergency';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        home: (context) => const HomeScreen(),
        emergency: (context) => const EmergencyScreen(),
        profile: (context) => const ProfileScreen(),
      };
}