import 'package:flutter/material.dart';
import 'package:food_app/app.dart';

// Providers
import 'package:food_app/context/auth_provider.dart';

// Pages
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
