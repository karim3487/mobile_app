import 'package:flutter/cupertino.dart';
import 'package:mobile_app/ui/home/home_page.dart';
import 'package:mobile_app/ui/timetable/timetable_page.dart';

import '../ui/auth/auth_page.dart';
import '../ui/file/file_page.dart';
import '../ui/teacher/teacher_page.dart';

class Routes {
  Routes._();

  //static variables
  // static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String teachers = '/teacher';
  static const String files = '/file';
  static const String timetable = '/timetable';

  static final routes = <String, WidgetBuilder>{
    // splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => AuthPage(),
    home: (BuildContext context) => const HomePage(),
    teachers: (BuildContext context) => const TeacherPage(),
    files: (BuildContext context) => const FilePage(),
    timetable: (BuildContext context) => const TimetablePage(),
  };
}
