import 'package:mobile_app/models/file.dart';

class FileList {
  final List<MyFile>? files;

  FileList({
    this.files,
  });

  factory FileList.fromJson(List<dynamic> json) {
    List<MyFile> files = <MyFile>[];
    files = json.map((file) => MyFile.fromJson(file)).toList();

    return FileList(
      files: files,
    );
  }
}
