import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'api/api_client.dart';
import 'auth/auth_page.dart';
import 'auth/auth_store.dart';

void main() {
  final apiClient = ApiClient();
  final authStore = AuthStore(apiClient);
  runApp(MobileApp(
    authStore: authStore,
  ));
}

class MobileApp extends StatelessWidget {
  final AuthStore authStore;

  const MobileApp({super.key, required this.authStore});

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
      initialRoute: '/',
      routes: {
        '/': (context) => AuthPage(authStore: authStore),
      },
    );
  }
}
