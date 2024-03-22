import 'package:fit_ness/screens/home_screen.dart';
import 'package:fit_ness/services/router_service.dart';
import 'package:flutter/material.dart';

void main() {
  CustomNavigationHelper.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: CustomNavigationHelper.router,
    );
  }
}
