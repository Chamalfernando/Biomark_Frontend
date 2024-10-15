import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/database_helper.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    var dbHelper = DatabaseHelper.instance;
    var newUser = User(
      fullName: name,
      dob: "1990-01-01",  // Example data
      email: email,
      password: password,
      mothersMaidenName: "Test",
      childhoodFriend: "Friend",
      petName: "Pet",
      customQuestion: "Question",
    );

    await dbHelper.insertUser(newUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Column(
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: "Full Name")),
          TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
          TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
          ElevatedButton(onPressed: _register, child: Text("Register")),
        ],
      ),
    );
  }
}
