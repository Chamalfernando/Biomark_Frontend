import 'package:uuid/uuid.dart';
// import "package:hive/hive.dart";

class User {
  String id; // Unique identifier
  final String firstName;
  final String lastName;
  final String fullName;
  final String dob;
  final String email;
  final String password;
  final String maidenName;
  final String bestFriendName;
  final String petName;
  final String customQuestion;
  final String customAnswer;

  User({
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.dob,
    required this.email,
    required this.password,
    required this.maidenName,
    required this.bestFriendName,
    required this.petName,
    required this.customQuestion,
    required this.customAnswer,
  }) : id = const Uuid().v4(); // Generate a unique ID using the UUID package

  // To convert the User object to a map that Hive can store
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'dob': dob,
      'email': email,
      'password': password,
      'maidenName': maidenName,
      'bestFriendName': bestFriendName,
      'petName': petName,
      'customQuestion': customQuestion,
      'customAnswer': customAnswer,
    };
  }

  // Convert Map back to a User object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'],
      lastName: map['lastName'],
      fullName: map['fullName'],
      dob: map['dob'],
      email: map['email'],
      password: map['password'],
      maidenName: map['maidenName'],
      bestFriendName: map['bestFriendName'],
      petName: map['petName'],
      customQuestion: map['customQuestion'],
      customAnswer: map['customAnswer'],
    );
  }

  set passWord(String passWord) {}
}
