import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // 👈 add const
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("🏠 Home Page"));
  }
}
