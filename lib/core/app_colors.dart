import 'package:flutter/material.dart';

class AppColors {
  // Brand & Accent Colors
  static const Color primaryGold = Color(0xFFD19025);
  static const Color goldMedium = Color(0xFFD9AC40);
  static const Color goldLight = Color(0xFFF5E77E);
  static const Color yellowAccent = Color(0xFFF0C24D);

  // Backgrounds & Surfaces
  static const Color scaffoldBg = Color(0xFFFFFDF9);
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color cardBg = Color(0xFFF7F2FA);
  static const Color grayInput = Color(0xFFD9D9D9);

  // Action & Functional
  static const Color navyButton = Color(0xFF2A5EB0);
  static const Color purpleButton = Color(0xFF8968F6);
  static const Color successGreen = Color(0xFF2ED542);
  static const Color textDark = Color(0xFF1D1B20);
  static const Color textMuted = Color(0xFF49454F);

  // Gradient Promo Banner
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryGold, goldMedium, goldLight],
  );
}
