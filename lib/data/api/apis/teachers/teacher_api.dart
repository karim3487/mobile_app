import '../../../../models/teacher_list.dart';
import '../../api_client.dart';
import '../../constants/endpoints.dart';

class TeacherApi {
  // apiClient instance
  final DioClient _apiClient;

  // constructor
  TeacherApi(this._apiClient);

  Future<TeacherList> getTeachers() async {
    try {
      final res = await _apiClient.get(Endpoints.getTeachers);
      return TeacherList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
