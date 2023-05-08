import 'package:get_it/get_it.dart';
import '../data/network/apis/ads/ad_api.dart';
import '../stores/ad_store.dart';
// import 'package:mobx_flutter/stores/user/user_store.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(AdApi());
  getIt.registerSingleton(AdStore(getIt.get<AdApi>()));
}
