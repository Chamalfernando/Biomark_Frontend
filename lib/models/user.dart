import 'package:uuid/uuid.dart';

class RegisterUser {
  String id; // Unique identifier
  final String firstName;
  final String lastName;
  final String fullName;
  final String dob;
  final String email;
  final String maidenName;
  final String bestFriendName;
  final String petName;
  final String customQuestion;
  final String customAnswer;

  RegisterUser({
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.dob,
    required this.email,
    required this.maidenName,
    required this.bestFriendName,
    required this.petName,
    required this.customQuestion,
    required this.customAnswer,
  }) : id = const Uuid().v4(); // Generate a unique ID using the UUID package

  // To convert the RegisterUser object to a map that Hive can store
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'dob': dob,
      'email': email,
      'maidenName': maidenName,
      'bestFriendName': bestFriendName,
      'petName': petName,
      'customQuestion': customQuestion,
      'customAnswer': customAnswer,
    };
  }

  // Convert Map back to a RegisterUser object
  factory RegisterUser.fromMap(
    Map<String, dynamic> map, {
    required String firstName,
    required String lastName,
    required String fullName,
    required String dob,
    required String email,
    required String maidenName,
    required String bestFriendName,
    required String petName,
    required String customQuestion,
    required String customAnswer,
  }) {
    return RegisterUser(
      firstName: map['firstName'],
      lastName: map['lastName'],
      fullName: map['fullName'],
      dob: map['dob'],
      email: map['email'],
      maidenName: map['maidenName'],
      bestFriendName: map['bestFriendName'],
      petName: map['petName'],
      customQuestion: map['customQuestion'],
      customAnswer: map['customAnswer'],
    );
  }
}


/**
 * 
 * user - pawan
 * email - pawan@liyanage.net
 * password - Pawan@123
 * 
 * user -
 */