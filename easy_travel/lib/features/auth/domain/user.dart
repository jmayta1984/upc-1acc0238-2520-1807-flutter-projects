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
}
