import 'package:flutter/material.dart';
import 'package:mobile_app/shared/colors.dart';

import 'api/di/locator.dart';
import 'auth/auth_page.dart';
import 'home/home_page.dart';

void main() {
  setupLocator();
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Кафедра О7",
      theme: ThemeData(
        primaryColor: MyColors.primary,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.primary,
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => AuthPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
