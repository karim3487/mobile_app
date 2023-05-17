// import 'dart:io';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  @computed
  Color get color {
    switch (ext.toLowerCase()) {
      case ".pdf":
        return const Color.fromRGBO(220, 137, 137, 1);
      case ".doc":
      case ".docx":
        return const Color.fromRGBO(135, 196, 149, 1);
      case ".xls":
      case ".xlsx":
        return const Color.fromRGBO(162, 154, 206, 1);
      case ".ppt":
      case ".pptx":
        return const Color.fromRGBO(178, 156, 202, 1);
      case ".jpg":
      case ".jpeg":
      case ".png":
        return const Color.fromRGBO(142, 208, 219, 1);
      case ".mp3":
      case ".wav":
        return const Color.fromRGBO(160, 215, 112, 1);
      case ".mp4":
      case ".avi":
        return const Color.fromRGBO(214, 169, 117, 1);
      default:
        return const Color.fromRGBO(163, 189, 200, 1);
    }
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
