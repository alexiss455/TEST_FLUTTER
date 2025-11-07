import 'package:flutter/material.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Food App",
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        fontFamily: 'Inter',
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: const TextTheme(
          bodyLarge:
              TextStyle(color: AppColors.textPrimary, fontFamily: 'Inter'),
          bodyMedium:
              TextStyle(color: AppColors.textPrimary, fontFamily: 'Inter'),
          bodySmall:
              TextStyle(color: AppColors.textPrimary, fontFamily: 'Inter'),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.textPrimary,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
