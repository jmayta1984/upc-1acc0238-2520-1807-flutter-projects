class User {
  final String firstName;
  final String lastName;
  final String email;
  final String token;

  const User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      token: json['token'],
    );
  }
}
