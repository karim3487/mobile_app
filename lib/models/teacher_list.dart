import 'package:mobile_app/models/teacher.dart';

class TeacherList {
  final List<Teacher>? teachers;

  TeacherList({
    this.teachers,
  });

  factory TeacherList.fromJson(List<dynamic> json) {
    List<Teacher> teachers = <Teacher>[];
    teachers = json.map((teacher) => Teacher.fromJson(teacher)).toList();

    return TeacherList(
      teachers: teachers,
    );
  }
}
