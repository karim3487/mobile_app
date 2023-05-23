import 'package:flutter/material.dart';

class Timetable {
  bool? isEven;
  String? code;
  int? day;
  List<Lesson>? allSubjects;

  Timetable({this.isEven, this.code, this.day, this.allSubjects});

  Timetable.fromJson(Map<String, dynamic> json) {
    isEven = json['is_even'];
    code = json['code'];
    day = json['day'];
    if (json['all_subjects'] != null) {
      allSubjects = <Lesson>[];
      json['all_subjects'].forEach((v) {
        allSubjects!.add(new Lesson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_even'] = this.isEven;
    data['code'] = this.code;
    data['day'] = this.day;
    if (this.allSubjects != null) {
      data['all_subjects'] = this.allSubjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lesson {
  int? id;
  String? title;
  TimeOfDay? start;
  TimeOfDay? end;
  String? classroom;
  List<Professor>? professors;

  TimeOfDay? parseTimeOfDay(String? timeString) {
    try {
      List<String> parts = timeString!.split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      return TimeOfDay(hour: 0, minute: 0);
    }
  }

  Lesson(
      {this.id,
      this.title,
      this.start,
      this.end,
      this.classroom,
      this.professors});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    start = parseTimeOfDay(json['start']);
    end = parseTimeOfDay(json['end']);
    classroom = json['classroom'];
    if (json['professors'] != null) {
      professors = <Professor>[];
      json['professors'].forEach((v) {
        professors!.add(new Professor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['start'] = this.start;
    data['end'] = this.end;
    data['classroom'] = this.classroom;
    if (this.professors != null) {
      data['professors'] = this.professors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Professor {
  int? tId;
  String? name;

  Professor({this.tId, this.name});

  Professor.fromJson(Map<String, dynamic> json) {
    tId = json['t_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t_id'] = this.tId;
    data['name'] = this.name;
    return data;
  }
}
