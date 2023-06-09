import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/files/file_list_store.dart';
import '../stores/teacher/teacher_store.dart';
import '../stores/timetable/timetable_store.dart';
import '../stores/user/user_store.dart';
import '../ui/auth/auth_page.dart';
import '../data/repository.dart';
import '../ui/home/home_page.dart';
import '../shared/colors.dart';
import '../di/locator.dart';
import '../shared/strings.dart';
import '../stores/auth/auth_store.dart';
import '../stores/home/home_store.dart';
import '../utils/routes.dart';

void main() async {
  setupLocator();
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  final AuthStore _authStore = AuthStore(locator<Repository>());
  final UserStore _userStore = UserStore(locator<Repository>());
  final HomeStore _homeStore = HomeStore(locator<Repository>());
  final TeacherStore _teacherStore = TeacherStore(locator<Repository>());
  final FileListStore _fileStore = FileListStore(locator<Repository>());
  final TimetableStore _timetableStore = TimetableStore(locator<Repository>());

  MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => _authStore),
        Provider<UserStore>(create: (_) => _userStore),
        Provider<HomeStore>(create: (_) => _homeStore),
        Provider<TeacherStore>(create: (_) => _teacherStore),
        Provider<FileListStore>(create: (_) => _fileStore),
        Provider<TimetableStore>(create: (_) => _timetableStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: ThemeData(
              // primaryColor: AppColors.orange[900],
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Colors.transparent,
              textTheme:
                  const TextTheme(titleLarge: TextStyle(color: Colors.white)),
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.secondary,
              ),
            ),
            routes: Routes.routes,
            home: _authStore.isAuthenticated ? const HomePage() : AuthPage(),
          );
        },
      ),
    );
  }
}
