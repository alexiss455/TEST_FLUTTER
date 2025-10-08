import 'package:FBM/pages/auth/_id_confirmation.dart';
import 'package:FBM/pages/auth/_registration.dart';
import 'package:FBM/pages/auth/_selfie_verification.dart';
import 'package:FBM/pages/auth/_success_verify_selfie.dart';
import 'package:flutter/material.dart';
import 'package:FBM/context/auth_provider.dart';
import 'package:FBM/pages/auth/_login.dart';
import 'package:FBM/pages/profile/_profile.dart';
import 'package:FBM/pages/root_page.dart';
import 'package:FBM/pages/scan/_scan.dart';
import 'package:FBM/pages/transaction/_transaction.dart';
import 'package:FBM/pages/wallet/_wallet.dart';
import 'package:FBM/routes/route_list.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    return PageRouteBuilder(
      transitionDuration:
          const Duration(milliseconds: 150), // 👈 speed (faster)
      reverseTransitionDuration:
          const Duration(milliseconds: 150), // 👈 back speeds
      pageBuilder: (context, animation, secondaryAnimation) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);

        switch (settings.name) {
          /// PUBLIC ROUTES (slide)
          case AppRoutes.login:
            return LoginPage();
          case AppRoutes.registration:
            return Registration();
          case AppRoutes.idConfirmation:
            return IDConfirmation();
          case AppRoutes.selfieVerification:
            return SelfieVerificationPage();
          case AppRoutes.selfieVerificationSuccess:
            return SelfieVerificationSuccess();

          /// PRIVATE ROUTES (fade if authenticated, else slide back to login)
          case AppRoutes.home:
            return authProvider.isAuthenticated
                ? const RootPage()
                : LoginPage();

          case AppRoutes.transactions:
            return authProvider.isAuthenticated
                ? const TransactionsPage()
                : LoginPage();

          case AppRoutes.scan:
            return authProvider.isAuthenticated
                ? const ScanPage()
                : LoginPage();

          case AppRoutes.wallet:
            return authProvider.isAuthenticated
                ? const WalletPage()
                : LoginPage();

          case AppRoutes.profile:
            return authProvider.isAuthenticated
                ? const ProfilePage()
                : LoginPage();

          /// FALLBACK
          default:
            return const Scaffold(
              body: Center(child: Text("Page not found")),
            );
        }
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final isAuthRoute = [
          AppRoutes.login,
          AppRoutes.registration,
          AppRoutes.idConfirmation,
          AppRoutes.selfieVerification,
          AppRoutes.selfieVerificationSuccess,
        ].contains(settings.name);

        if (isAuthRoute) {
          // Slide animation for auth/public pages
          return SlideTransition(
            transformHitTests: true,
            position:
                Tween(begin: Offset(1, 0), end: Offset.zero).animate(animation),
            child: child,
          );
        } else {
          // Fade animation for private pages
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }
      },
    );
  }
}
