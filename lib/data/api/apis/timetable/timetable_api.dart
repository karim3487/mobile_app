import 'package:mobile_app/models/timetable_list.dart';

import '../../api_client.dart';
import '../../constants/endpoints.dart';

class TimetableApi {
  // apiClient instance
  final DioClient _apiClient;

  // constructor
  TimetableApi(this._apiClient);

  Future<TimetableList> getTimetable(String groupCode) async {
    try {
      final res = await _apiClient.get(Endpoints.getGroupTimeTable + groupCode);
      return TimetableList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
