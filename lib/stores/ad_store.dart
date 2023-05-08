import 'package:mobx/mobx.dart';
import '../data/models/ad.dart';
import '../data/network/apis/ads/ad_api.dart';

part 'ad_store.g.dart';

class AdStore = _AdStore with _$AdStore;

abstract class _AdStore with Store {
  _AdStore(AdApi adApi) : _adApi = adApi;

  late final AdApi _adApi;

  // store variables:-----------------------------------------------------------
  @observable
  List<Ad> ads = [];

  @observable
  bool isLoading = false;

  // actions:-------------------------------------------------------------------
  @action
  Future getAds() async {
    isLoading = true;
    final adList = await _adApi.getAds();
    ads = adList;
    isLoading = false;
  }
}
