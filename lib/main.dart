import 'package:flutter/material.dart';

import 'api/di/locator.dart';
import 'auth/auth_page.dart';
import 'auth/auth_store.dart';
import 'home/home_page.dart';

void main() {
  setupLocator();
  final authStore = AuthStore();
  // final homeStore = HomeStore(apiClient);
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Кафедра О7",
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(254, 176, 61, 1),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
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
