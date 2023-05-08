import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_app/views/landing.dart';

import 'colors.dart';

void main() {
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
          backgroundColor: AppColors.appBarColor,
        ),
      ),
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [GradientColors.startColor, GradientColors.endColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: const LandingPage(),
      ),
    );
  }
}
