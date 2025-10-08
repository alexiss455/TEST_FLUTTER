import 'package:flutter/material.dart';
import 'package:FBM/app.dart';

// Providers
import 'package:FBM/context/auth_provider.dart';
import 'package:flutter/rendering.dart';

// Pages
import 'package:provider/provider.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
