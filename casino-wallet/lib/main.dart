import 'package:flutter/material.dart';
import 'package:casino/app.dart';

// Providers
import 'package:casino/context/auth_provider.dart';

// Pages
import 'package:provider/provider.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
