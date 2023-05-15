import 'package:flutter/cupertino.dart';
import 'package:mobile_app/ui/home/home_page.dart';

import '../ui/auth/auth_page.dart';
import '../ui/teacher/teacher_page.dart';

class Routes {
  Routes._();

  //static variables
  // static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String teachers = '/teacher';

  static final routes = <String, WidgetBuilder>{
    // splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => AuthPage(),
    home: (BuildContext context) => const HomePage(),
    teachers: (BuildContext context) => const TeacherPage(),
  };
}
