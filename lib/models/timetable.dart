class Timetable {
  bool? isEven;
  String? code;
  int? day;
  List<AllSubjects>? allSubjects;

  Timetable({this.isEven, this.code, this.day, this.allSubjects});

  Timetable.fromJson(Map<String, dynamic> json) {
    isEven = json['is_even'];
    code = json['code'];
    day = json['day'];
    if (json['all_subjects'] != null) {
      allSubjects = <AllSubjects>[];
      json['all_subjects'].forEach((v) {
        allSubjects!.add(new AllSubjects.fromJson(v));
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

class AllSubjects {
  int? id;
  String? title;
  String? start;
  Null? end;
  String? classroom;
  List<Professors>? professors;

  AllSubjects(
      {this.id,
      this.title,
      this.start,
      this.end,
      this.classroom,
      this.professors});

  AllSubjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    start = json['start'];
    end = json['end'];
    classroom = json['classroom'];
    if (json['professors'] != null) {
      professors = <Professors>[];
      json['professors'].forEach((v) {
        professors!.add(new Professors.fromJson(v));
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

class Professors {
  int? tId;
  String? name;

  Professors({this.tId, this.name});

  Professors.fromJson(Map<String, dynamic> json) {
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
