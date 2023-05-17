import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

import '../../models/file.dart';

part 'file_store.g.dart';

class FileStore = _FileStore with _$FileStore;

abstract class _FileStore with Store {
  final MyFile file;

  // constructor:---------------------------------------------------------------
  _FileStore(this.file);

  // store variables:-----------------------------------------------------------
  @observable
  bool isUploading = false;

  @observable
  double progress = 0.0;

  @observable
  bool successDownload = false;

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

  // actions:-------------------------------------------------------------------
  @action
  Future<void> uploadFile(Function(String) callback) async {
    try {
      isUploading = true;
      String fileUrl = file.fileUrl;
      String fileName = file.title;
      String message = "";

      final File? f = (await FileDownloader.downloadFile(
          url: fileUrl,
          name: "$fileName$ext",
          onProgress: (fileName, progress) {
            this.progress = progress;
          },
          onDownloadCompleted: (path) {
            successDownload = true;
            message = 'Файл сохранен в $path';
          },
          onDownloadError: (paht) {
            message = paht;
          }));

      callback(message);

      print('FILE: ${f?.path}');
    } catch (e) {
      print(e);
    } finally {
      isUploading = false;
      // successDownload = false;
      progress = 0.0;
    }
  }
}
