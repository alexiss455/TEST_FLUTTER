import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFFE43135);
  static const Color primaryLight = Color(0xFFFFE6E6);
  static const Color secondary = Color(0xFFFF9800);
  static const Color accent = Color(0xFF4CAF50);

  // Neutral / Background colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);

  static const Color grey = Color(0xFFD6D6D6);
  static const Color greyLight = Color(0xFFF7F7FB);
  static const Color greyLight2 = Color(0xFFE0E0E0);
  static const Color greyLight3 = Color(0xFFF4F4F4);

  static const Color blueLight = Color(0xFFECF1FD);
  static const Color blueLight1 = Color(0xFFF6FAFF);

  // Text colors
  static const Color textPrimary = Color(0xFF555B70);
  static const Color textSecondary = Color(0xFFAAADB8);
  static const Color textLight = Color(0xFFFFFFFF);

  // Status colors
  static const Color success = Color(0xFF31A139);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  // Shadow colors
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color.fromARGB(0, 0, 0, 0);

  // RGB
  static const Color warningLight = Color(0xFFFF883F);

  // Gradients
  static const LinearGradient gradient1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 145, 18, 18),
      AppColors.primary,
    ],
  );

  // Shadows (non-const, because withOpacity is runtime)
  static final BoxShadow shadow1 = BoxShadow(
    color: black.withOpacity(0.05),
    blurRadius: 1.0,
    spreadRadius: 1.0,
    offset: const Offset(0, 1),
  );

  // Radius
  static const double mainRadius1 = 20.0;
  static const double mainRadius2 = 40.0; // used for ovoerlapping
  static const double subRadius = 12.0;
  static const double circleRadius = 100.0;

  // Paddimng
  static const double mainPadding = 16.0;
}
