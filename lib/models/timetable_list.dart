import 'package:mobile_app/models/timetable.dart';

class TimetableList {
  final List<Timetable>? timetables;

  TimetableList({
    this.timetables,
  });

  Timetable operator [](int index) {
    return timetables![index];
  }

  factory TimetableList.fromJson(List<dynamic> json) {
    List<Timetable> timetables = <Timetable>[];
    timetables =
        json.map((timetable) => Timetable.fromJson(timetable)).toList();

    return TimetableList(
      timetables: timetables,
    );
  }
}
