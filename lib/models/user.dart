import 'dart:convert';

class User {
  final String name;
  final String profileUrl;
  final DateTime dateOfBirth;
  final String email;
  final String phoneNumber;
  final int score;

  User({
    required this.name,
    required this.profileUrl,
    required this.dateOfBirth,
    required this.email,
    required this.phoneNumber,
    required this.score,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      profileUrl: map['profileUrl'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      score: map['score'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profileUrl': profileUrl,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'email': email,
      'phoneNumber': phoneNumber,
      'score': score,
    };
  }
}

String movieToJson(User movie) {
  return json.encode(movie.toMap());
}

User movieFromJson(String source) {
  return User.fromMap(json.decode(source));
}