import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

part 'file_store.g.dart';

class FileStore = _FileStore with _$FileStore;

abstract class _FileStore with Store {
  final String fileUrl;
  CancelToken? _cancelToken;

  _FileStore(this.fileUrl);

  // Дополнительные поля и действия для файла

  @observable
  bool isUploading = false;

  @observable
  double progress = 0.0;

  @action
  Future<void> uploadFile() async {
    try {
      isUploading = true;
      print(fileUrl);

      final File? file =
          await FileDownloader.downloadFile(url: fileUrl, name: "asd.pdf");

      print('FILE: ${file?.path}');

      // Загрузка файла завершена успешно
    } catch (e) {
      print(e);
      // Обработка ошибок при загрузке файла
    } finally {
      isUploading = false;
      progress = 0.0;
    }
  }

  @action
  void cancelUpload() {
    _cancelToken?.cancel("Загрузка отменена пользователем");
  }
}
