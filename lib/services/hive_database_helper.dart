// import 'package:biomark/models/user.dart';
// import 'package:biomark/services/validator_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// Future<void> saveUser(User user, BuildContext context) async {
//   // Open the box (think of it like a collection or table)
//   var box = await Hive.openBox('userBox');

//   // Hash the password before saving it using bcrypt & Update the user object with the hashed password
//   user.passWord = hashPassword(user.password);

//   // Insert the user as a map (Hive uses key-value pairs)
//   await box.put(
//     user.id,
//     user.toMap(),
//   ); // We use email as the unique key for simplicity

//   // Show a SnackBar after successful insertion
//   // ignore: use_build_context_synchronously
//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(
//       content: Text(
//         'User data successfully saved!',
//       ),
//     ),
//   );
// }

// // Future<User?> getUser(String email) async {
// //   var box = await Hive.openBox('userBox');
// //   var userData = box.get(email);

// //   if (userData != null) {
// //     return User.fromMap(Map<String, dynamic>.from(userData));
// //   }
// //   return null;
// // }

// Future<User?> getUserById(String id) async {
//   var box = await Hive.openBox('userBox');

//   // Get user data by id
//   var userData = box.get(id);

//   if (userData != null) {
//     return User.fromMap(Map<String, dynamic>.from(userData));
//   }
//   return null;
// }
