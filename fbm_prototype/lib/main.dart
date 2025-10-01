import 'package:flutter/material.dart';
import 'package:FBM/app.dart';

// Providers
import 'package:FBM/context/auth_provider.dart';

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
