class User {
  final String firstName;
  final String lastName;
  final String email;
 

  const User({
    required this.email,
    required this.firstName,
    required this.lastName,
   
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName']
    );
  }
}
