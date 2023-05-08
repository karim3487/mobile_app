import 'user.dart';

class Ad {
  int? id;
  User? creator;
  String? title;
  String? text;

  Ad({this.id, this.creator, this.title, this.text});

  Ad.fromJson(Map<String, dynamic> dataJson) {
    id = dataJson['id'];
    creator = User.fromJson(dataJson['creator']);
    title = dataJson['title'];
    text = dataJson['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['creator'] = creator;
    data['title'] = title;
    data['text'] = text;
    return data;
  }
}
