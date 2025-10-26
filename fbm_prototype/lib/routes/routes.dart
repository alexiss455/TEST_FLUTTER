import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:FBM/context/auth_provider.dart';
import 'package:FBM/pages/auth/_login.dart';
import 'package:FBM/pages/auth/_registration.dart';
import 'package:FBM/pages/auth/_id_confirmation.dart';
import 'package:FBM/pages/auth/_selfie_verification.dart';
import 'package:FBM/pages/auth/_success_verify_selfie.dart';
import 'package:FBM/pages/root_page.dart';
import 'package:FBM/pages/transaction/_transaction.dart';
import 'package:FBM/pages/transaction/_details.dart';
import 'package:FBM/pages/profile/_profile.dart';
import 'package:FBM/pages/wallet/_wallet.dart';
import 'package:FBM/pages/scan/_scan.dart';
import 'package:FBM/routes/route_list.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    redirect: (context, state) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final isAuth = authProvider.isAuthenticated;

      print(isAuth);

      // Redirect unauthenticated users trying to access private routes
      final isAuthRoute = [
        AppRoutes.login,
        AppRoutes.registration,
        AppRoutes.idConfirmation,
        AppRoutes.selfieVerification,
        AppRoutes.selfieVerificationSuccess,
      ].contains(state.fullPath);

      if (!isAuth && !isAuthRoute) return AppRoutes.login;
      if (isAuth && isAuthRoute) return AppRoutes.home;
      return null; // no redirect
    },
    routes: [
      /// 🧑‍💻 Public routes
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => LoginPage(),
        pageBuilder: (context, state) => _slidePage(LoginPage()),
      ),
      GoRoute(
        path: AppRoutes.registration,
        builder: (context, state) => Registration(),
        pageBuilder: (context, state) => _slidePage(Registration()),
      ),
      GoRoute(
        path: AppRoutes.idConfirmation,
        builder: (context, state) => IDConfirmation(),
        pageBuilder: (context, state) => _slidePage(IDConfirmation()),
      ),
      GoRoute(
        path: AppRoutes.selfieVerification,
        builder: (context, state) => SelfieVerificationPage(),
        pageBuilder: (context, state) => _slidePage(SelfieVerificationPage()),
      ),
      GoRoute(
        path: AppRoutes.selfieVerificationSuccess,
        builder: (context, state) => SelfieVerificationSuccess(),
        pageBuilder: (context, state) =>
            _slidePage(SelfieVerificationSuccess()),
      ),

      /// 🔒 Private routes (fade transition)
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => RootPage(),
        pageBuilder: (context, state) => _fadePage(RootPage()),
      ),
      GoRoute(
        path: AppRoutes.transactions,
        builder: (context, state) => TransactionsPage(),
        pageBuilder: (context, state) => _fadePage(TransactionsPage()),
      ),
      GoRoute(
        path: AppRoutes.transactionsDetails,
        builder: (context, state) => TransactionDetailsPage(),
        pageBuilder: (context, state) => _fadePage(TransactionDetailsPage()),
      ),
      GoRoute(
        path: AppRoutes.scan,
        builder: (context, state) => ScanPage(),
        pageBuilder: (context, state) => _fadePage(ScanPage()),
      ),
      GoRoute(
        path: AppRoutes.wallet,
        builder: (context, state) => WalletPage(),
        pageBuilder: (context, state) => _fadePage(WalletPage()),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => ProfilePage(),
        pageBuilder: (context, state) => _fadePage(ProfilePage()),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found')),
    ),
  );

  /// Slide transition (for auth/public routes)
  static CustomTransitionPage _slidePage(Widget child) {
    return CustomTransitionPage(
      key: ValueKey(child.hashCode),
      child: child,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetTween = Tween(begin: Offset(1, 0), end: Offset.zero);
        return SlideTransition(
            position: offsetTween.animate(animation), child: child);
      },
    );
  }

  /// Fade transition (for private routes)
  static CustomTransitionPage _fadePage(Widget child) {
    return CustomTransitionPage(
      key: ValueKey(child.hashCode),
      child: child,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
