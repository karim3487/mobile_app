import 'dart:ui';

import 'package:flutter/cupertino.dart';

class GradientColors {
  static const Color startColor = Color.fromRGBO(255, 138, 0, 1);
  static const Color endColor = Color.fromRGBO(255, 222, 47, 1);
}

class AppColors {
  static const Color appBarColor = Color.fromRGBO(255, 138, 0, 1);
  static const Color navBarColor = Color.fromRGBO(255, 195, 0, 1.0);
}

class GradientBd {
  static const BoxDecoration dec = BoxDecoration(
    gradient: LinearGradient(
      colors: [GradientColors.startColor, GradientColors.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    ),
  );
}
