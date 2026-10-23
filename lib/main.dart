import 'dart:ui';
import 'package:flutter/material.dart';
import 'core/app_colors.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sweet Dessert App',
      // Mengaktifkan drag gesture untuk mouse & touch agar bisa digeser di Chrome / Desktop
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.stylus,
        },
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        primaryColor: AppColors.primaryGold,
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
