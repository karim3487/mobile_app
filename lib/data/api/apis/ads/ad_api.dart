import '../../../../models/ad_list.dart';
import '../../api_client.dart';
import '../../constants/endpoints.dart';

class AdApi {
  // apiClient instance
  final DioClient _apiClient;

  // constructor
  AdApi(this._apiClient);

  Future<AdList> getAds() async {
    try {
      final res = await _apiClient.get(Endpoints.getAds);
      return AdList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
