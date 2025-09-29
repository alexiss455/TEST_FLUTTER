import 'package:flutter/material.dart';
import 'package:food_app/routes/route_list.dart';
import 'package:food_app/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
