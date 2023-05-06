import 'package:flutter/material.dart';
import 'package:mobile_app/pages/landing.dart';

import 'colors.dart';

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
          scaffoldBackgroundColor: Colors.transparent,
          textTheme:
              const TextTheme(titleLarge: TextStyle(color: Colors.white))
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
