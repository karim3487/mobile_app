import 'package:mobile_app/models/timetable_list.dart';

import '../../../../models/group_list.dart';
import '../../api_client.dart';
import '../../constants/endpoints.dart';

class TimetableApi {
  // apiClient instance
  final DioClient _apiClient;

  // constructor
  TimetableApi(this._apiClient);

  Future<TimetableList> getTimetable(String groupCode, String day) async {
    try {
      final res = await _apiClient
          .get('${Endpoints.getGroupTimeTable}$groupCode?date=$day');
      return TimetableList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<GroupList> getGroups() async {
    try {
      final res = await _apiClient.get(Endpoints.getGroups);
      return GroupList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
