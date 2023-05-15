import 'package:mobile_app/models/file.dart';

class FileList {
  final List<File>? files;

  FileList({
    this.files,
  });

  factory FileList.fromJson(List<dynamic> json) {
    List<File> files = <File>[];
    files = json.map((file) => File.fromJson(file)).toList();

    return FileList(
      files: files,
    );
  }
}
