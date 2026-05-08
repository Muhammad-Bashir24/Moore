import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF3B5BDB);
  static const Color deepBlue = Color(0xFF1B2C84);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color gray = Color(0xFF8E8E93);
  static const Color lightGray = Color(0xFFE5E5EA);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF4C6FFF),
      Color(0xFF2E4ECC),
      Color(0xFF1A2980),
    ],
  );
}
