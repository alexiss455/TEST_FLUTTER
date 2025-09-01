import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/pages/auth/_login.dart';
import 'package:food_app/pages/home/_home.dart';
import 'package:food_app/pages/notification/_notification.dart';
import 'package:food_app/pages/profile/_profile.dart';
import 'package:food_app/pages/scan/_scan.dart';
import 'package:food_app/pages/transaction/_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  // List of pages for each bottom navigation index
  final List<Widget> _tabPages = [
    HomePage(),
    TransactionsPage(),
    ScanPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabPages[_selectedIndex], // show the current page
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  Widget _buildNavItem(String asset, String label, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            asset,
            width: 24,
            height: 24,
            color: isSelected ? Colors.red : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white, // background color
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem("assets/img/icon/home.svg", "Home", 0),
              _buildNavItem(
                  "assets/img/icon/transactions.svg", "Transactions", 1),
              const SizedBox(width: 60), // space for FAB
              _buildNavItem(
                  "assets/img/icon/notifications.svg", "Notifications", 3),
              _buildNavItem("assets/img/icon/profile.svg", "Profile", 4),
            ],
          ),

          // Floating Center Button
          Positioned(
            top: -25,
            child: GestureDetector(
              onTap: () => onItemTapped(2), // Scan page
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange],
                  ),
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.qr_code_scanner,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
