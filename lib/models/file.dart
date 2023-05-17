class MyFile {
  final String title;
  final String fileUrl;
  final String createdAt;
  final int size;

  MyFile({
    required this.title,
    required this.fileUrl,
    required this.createdAt,
    required this.size,
  });

  factory MyFile.fromJson(Map<String, dynamic> json) {
    return MyFile(
      title: json['title'],
      fileUrl: json['file'],
      createdAt: json['created_at'],
      size: json['size'],
    );
  }
}
