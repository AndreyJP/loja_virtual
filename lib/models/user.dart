class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int age;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.age,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      image: json['image'],
      age: json['age'],
      id: json['id'],
    );
  }
}
