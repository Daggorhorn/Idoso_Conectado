import 'package:flutter/material.dart';

import '../screens/splash/splash_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/emergency/emergency_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/medications/medications_screen.dart';
import '../screens/medications/add_medication_screen.dart';
import '../screens/consultations/consultations_screen.dart';
import '../screens/rights/rights_screen.dart';
import '../screens/rights/health/health_screen.dart';

class AppRoutes {
  
  static const String splash = '/';
  static const String home = '/home';
  static const String emergency = '/emergency';
  static const String profile = '/profile';
  static const String medications = '/medications';
  static const String addMedication = '/add-medication';
  static const String consultations = '/consultations';
  static const String rights = '/rights';
  static const String health = '/health';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        home: (context) => const HomeScreen(),
        emergency: (context) => const EmergencyScreen(),
        profile: (context) => const ProfileScreen(),
        medications: (context) => const MedicationsScreen(),
        addMedication: (context) => const AddMedicationScreen(),
        consultations: (context) => const ConsultationsScreen(),
        rights: (context) => const RightsScreen(),
        health: (context) => const HealthScreen(),
      };
}