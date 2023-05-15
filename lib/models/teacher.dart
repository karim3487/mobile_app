import 'user.dart';

class Teacher {
  final int id;
  final String fullName;
  final String jobTitle;
  final String imgUrl;

  Teacher({
    required this.id,
    required this.fullName,
    required this.jobTitle,
    required this.imgUrl,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      fullName: json['full_name'],
      jobTitle: json['job_title'],
      imgUrl: json['image'],
    );
  }
}
