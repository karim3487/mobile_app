class User {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? surname;
  final String? profession;
  final String? token;

  User(
      {this.email,
      this.firstName,
      this.lastName,
      this.surname,
      this.profession,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      surname: json['surname'],
      profession: json['profession'],
      token: json['token'],
    );
  }
}
