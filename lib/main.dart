import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_app/pages/home_page.dart';

import 'di/locator.dart';

void main() {
  setup();
  runApp(const MobileApp());
}

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Кафедра О7",
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(254, 176, 61, 1),
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      home: HomePage(),
    );
  }
}
