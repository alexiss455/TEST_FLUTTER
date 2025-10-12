import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_button_nav.dart';

// Pages
import 'package:FBM/pages/home/_home.dart';
import 'package:FBM/pages/profile/_profile.dart';
import 'package:FBM/pages/scan/_scan.dart';
import 'package:FBM/pages/transaction/_transaction.dart';
import 'package:FBM/pages/wallet/_wallet.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/',
    '/transactions',
    '/scan',
    '/wallet',
    '/profile',
  ];

  Future<void> _onItemTapped(int index) async {
    final String route = _routes[index];

    setState(() => _selectedIndex = index);
    _navigatorKey.currentState!.pushReplacement(_noTransitionRoute(route));
  }

  PageRoute _noTransitionRoute(String route) {
    Widget page;

    switch (route) {
      case '/':
        page = HomePage();
        break;
      case '/transactions':
        page = TransactionsPage();
        break;
      case '/scan':
        page = ScanPage();
        break;
      case '/wallet':
        page = WalletPage();
        break;
      case '/profile':
        page = ProfilePage();
        break;
      default:
        page = const Center(child: Text("Not found"));
    }

    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Navigator(
            key: _navigatorKey,
            onGenerateRoute: (settings) =>
                _noTransitionRoute(_routes[_selectedIndex]),
          ),
          bottomNavigationBar: CustomBottomNav(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          floatingActionButton: _buildFab(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }

  Widget _buildFab(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [AppColors.primary, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: () => _onItemTapped(2), // Scan tab
          child: SvgPicture.asset(
            'assets/img/icon/icon-scanner.svg',
            width: 30,
            height: 30,
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
