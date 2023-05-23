import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'ui/main_ui.dart';
import 'di/locator.dart';

void initializeLocaleData() async {
  await initializeDateFormatting('ru_RU');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  await setupLocator();

  initializeLocaleData(); // Await the initialization

  runZonedGuarded(() async {
    runApp(MobileApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
