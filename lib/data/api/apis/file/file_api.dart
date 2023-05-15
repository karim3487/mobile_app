import '../../../../models/file_list.dart';
import '../../api_client.dart';
import '../../constants/endpoints.dart';

class FileApi {
  // apiClient instance
  final DioClient _apiClient;

  // constructor
  FileApi(this._apiClient);

  Future<FileList> getFiles() async {
    try {
      final res = await _apiClient.get(Endpoints.getFiles);
      return FileList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
