import 'dart:ffi';

class File {
  final String title;
  final String fileUrl;
  final String createdAt;
  final int size;

  File({
    required this.title,
    required this.fileUrl,
    required this.createdAt,
    required this.size,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      title: json['title'],
      fileUrl: json['file'],
      createdAt: json['created_at'],
      size: json['size'],
    );
  }
}
