import 'package:get_it/get_it.dart';
import 'package:mobile_app/api/api_client.dart';

import '../../auth/auth_store.dart';
import '../../home/home_store.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiClient());
  locator.registerSingleton(AuthStore());
  locator.registerSingleton(HomeStore());
}
