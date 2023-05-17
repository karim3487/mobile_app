// import 'dart:io';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

import '../../models/file.dart';

part 'file_store.g.dart';

class FileStore = _FileStore with _$FileStore;

abstract class _FileStore with Store {
  final MyFile file;

  _FileStore(this.file);

  @observable
  bool isUploading = false;

  @observable
  double progress = 0.0;

  @computed
  String get fileSize {
    if (file.size > 10000) {
      return '${double.parse((file.size / 1000).toStringAsFixed(1)).toString()} MB';
    }
    return '${double.parse(file.size.toStringAsFixed(1)).toString()} KB';
  }

  @computed
  String get ext {
    return path.extension(file.fileUrl);
  }

  @action
  Future<void> uploadFile() async {
    try {
      isUploading = true;
      String fileUrl = file.fileUrl;
      String fileName = file.title;

      final File? f = (await FileDownloader.downloadFile(
        url: fileUrl,
        name: "$fileName.$ext",
        onProgress: (fileName, progress) {
          this.progress = progress;
        },
        onDownloadCompleted: (path) {
          print("Completed");
        },
      ));

      print('FILE: ${f?.path}');

      // Загрузка файла завершена успешно
    } catch (e) {
      print(e);
      // Обработка ошибок при загрузке файла
    } finally {
      isUploading = false;
      progress = 0.0;
    }
  }
}
