class User {
  final String email;
  final String firstName;
  final String lastName;
  final String surname;
  final String profession;
  final String? token;

  User(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.surname,
      required this.profession,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      surname: json['surname'],
      profession: json['profession'],
      token: json['profession'],
    );
  }
}
