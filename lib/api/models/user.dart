class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String surname;
  final String profession;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.surname,
    required this.profession,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      surname: json['surname'],
      profession: json['profession'],
    );
  }
}
