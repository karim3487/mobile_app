import 'package:mobx/mobx.dart';
import '../api/api_client.dart';
import '../api/di/locator.dart';
import '../api/models/ad.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final ApiClient _apiClient = locator<ApiClient>();

  @observable
  ObservableList<Ad> adsList = ObservableList<Ad>();

  @observable
  String errorMessage = '';

  @action
  Future<void> getAds() async {
    try {
      final ads = await _apiClient.getAds();
      adsList.addAll(ads);
    } catch (e) {
      errorMessage = 'Error loading news';
    }
  }
}
