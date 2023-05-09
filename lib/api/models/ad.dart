import 'user.dart';

class Ad {
  final int id;
  final String title;
  final User creator;
  final String text;

  Ad({
    required this.id,
    required this.title,
    required this.creator,
    required this.text,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['id'],
      creator: User.fromJson(json['creator']),
      title: json['title'],
      text: json['text'],
    );
  }
}
