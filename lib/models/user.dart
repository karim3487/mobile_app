class User {
  int? id;
  String? firstName;
  String? lastName;
  String? surname;
  String? profession;

  User({this.id, this.firstName, this.lastName, this.surname, this.profession});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    surname = json['surname'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['surname'] = this.surname;
    data['profession'] = this.profession;
    return data;
  }
}