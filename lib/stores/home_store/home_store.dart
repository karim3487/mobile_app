import 'package:mobx/mobx.dart';

import '../../models/ad.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  ObservableList<Ad> adsList = ObservableList<Ad>();

  @observable
  bool isLoading = false;

  @action
  Future<void> getAds() async {
    isLoading = true;
    // final ads = await _apiClient.getAds();
    // adsList.addAll(ads);
    isLoading = false;
  }
}
