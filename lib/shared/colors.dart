import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class
  static const Color primary = Color.fromRGBO(255, 138, 0, 1);
  static const Color secondary = Color.fromRGBO(255, 203, 14, 1);

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };
}

class GradientBd {
  static const Color startColor = Color.fromRGBO(255, 138, 0, 1);
  static const Color endColor = Color.fromRGBO(255, 222, 47, 1);

  static const LinearGradient gradient = LinearGradient(
    colors: [startColor, endColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );
}
