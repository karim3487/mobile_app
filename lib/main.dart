import 'package:flutter/material.dart';
import 'package:mobile_app/pages/login_page.dart';

void main() {
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Кафедра О7",
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(254, 176, 61, 1),
          textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white))),
      home: const LoginPage(),
    );
  }
}

