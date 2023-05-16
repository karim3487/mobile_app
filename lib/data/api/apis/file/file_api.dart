import 'dart:io';

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

  Future<File> downloadFile(String url, String savePath) async {
    try {
      final res = await _apiClient.download(url, savePath);
      return File(savePath);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
