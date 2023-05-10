import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../ui/auth/auth_page.dart';
import '../data/repository.dart';
import '../ui/home/home_page.dart';
import '../shared/colors.dart';
import '../di/locator.dart';
import '../shared/strings.dart';
import '../stores/auth_store/auth_store.dart';
import '../stores/home_store/home_store.dart';
import '../utils/routes.dart';

void main() async {
  setupLocator();
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  final AuthStore _authStore = AuthStore(locator<Repository>());
  final HomeStore _homeStore = HomeStore();

  MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => _authStore),
        Provider<HomeStore>(create: (_) => _homeStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: ThemeData(
              primaryColor: const Color.fromRGBO(254, 176, 61, 1),
              scaffoldBackgroundColor: Colors.transparent,
              textTheme:
                  const TextTheme(titleLarge: TextStyle(color: Colors.white)),
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.orange[400],
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
