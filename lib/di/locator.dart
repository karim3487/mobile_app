import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../stores/user/user_store.dart';
import 'modules/NetworkModule.dart';
import '../data/api/api_client.dart';
import '../data/sharedpref/shared_preference_helper.dart';
import '../di/modules/LocalModule.dart';
import '../data/api/apis/ads/ad_api.dart';
import '../data/api/apis/auth/auth_api.dart';
import '../data/api/rest_client.dart';
import '../data/repository.dart';
import '../stores/auth/auth_store.dart';
import '../stores/home/home_store.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // async singletons:----------------------------------------------------------
  locator.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  locator.registerSingleton(
      SharedPreferenceHelper(await locator.getAsync<SharedPreferences>()));
  locator.registerSingleton<Dio>(
      NetworkModule.provideDio(locator<SharedPreferenceHelper>()));
  locator.registerSingleton(DioClient(locator<Dio>()));
  locator.registerSingleton(RestClient());
  locator.registerSingleton(AdApi(locator<DioClient>()));
  locator.registerSingleton(AuthApi(locator<DioClient>()));

  // repository:----------------------------------------------------------------
  locator.registerSingleton(Repository(
    locator<SharedPreferenceHelper>(),
    locator<AuthApi>(),
    locator<AdApi>(),
  ));

  // stores:--------------------------------------------------------------------
  locator.registerSingleton(AuthStore(locator<Repository>()));
  locator.registerSingleton(UserStore(locator<Repository>()));
  locator.registerSingleton(HomeStore(locator<Repository>()));
}
