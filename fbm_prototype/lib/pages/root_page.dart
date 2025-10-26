import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_button_nav.dart';

class RootPage extends StatelessWidget {
  final Widget child;
  const RootPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Get current route for active tab highlight
    final String location = GoRouterState.of(context).uri.toString();

    int selectedIndex = 0;
    if (location.startsWith('/transactions'))
      selectedIndex = 1;
    else if (location.startsWith('/scan'))
      selectedIndex = 2;
    else if (location.startsWith('/wallet'))
      selectedIndex = 3;
    else if (location.startsWith('/profile')) selectedIndex = 4;

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/transactions');
          break;
        case 2:
          context.go('/scan');
          break;
        case 3:
          context.go('/wallet');
          break;
        case 4:
          context.go('/profile');
          break;
      }
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: _buildFab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFab(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
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
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: () => context.go('/scan'),
          child: SvgPicture.asset(
            'assets/img/icon/icon-scanner.svg',
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
