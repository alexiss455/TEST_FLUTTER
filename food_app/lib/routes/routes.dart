import 'package:flutter/material.dart';
import 'package:food_app/context/auth_provider.dart';
import 'package:food_app/pages/auth/_login.dart';
import 'package:food_app/pages/profile/_profile.dart';
import 'package:food_app/pages/root_page.dart';
import 'package:food_app/pages/scan/_scan.dart';
import 'package:food_app/pages/transaction/_transaction.dart';
import 'package:food_app/pages/wallet/_wallet.dart';
import 'package:food_app/routes/route_list.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      switch (settings.name) {
        /// PUBLIC ROUTES
        case AppRoutes.login:
          return LoginPage();

        /// PRIVATE ROUTES (require auth)
        case AppRoutes.home:
          return authProvider.isAuthenticated ? const RootPage() : LoginPage();

        case AppRoutes.transactions:
          return authProvider.isAuthenticated
              ? const TransactionsPage()
              : LoginPage();

        case AppRoutes.scan:
          return authProvider.isAuthenticated ? const ScanPage() : LoginPage();

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
    });
  }
}
