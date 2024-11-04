import 'package:biomark/resources/theme.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';
// import '../../models/user.dart';
// import '../../services/database_helper.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // void _register() async {
  //   String name = nameController.text;
  //   String email = emailController.text;
  //   String password = passwordController.text;

  //   var dbHelper = DatabaseHelper.instance;
  //   var newUser = User(
  //     fullName: name,
  //     dob: "1990-01-01", // Example data
  //     email: email,
  //     password: password,
  //     mothersMaidenName: "Test",
  //     childhoodFriend: "Friend",
  //     petName: "Pet",
  //     customQuestion: "Question",
  //   );

  //   await dbHelper.insertUser(newUser);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
        backgroundColor: primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  boxSIZED_20,
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/BioMark.png',
                    ),
                  ),
                  boxSIZED_40,
                  const CommonTopic(
                    topic: "Sign Up",
                  ),
                  boxSIZED_20,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Provide information for SignUp",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: black,
                      ),
                    ),
                  ),
                  boxSIZED_10,
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: "First Name",
                      fillColor: primaryGreen,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      height: 2.5,
                    ),
                  ),
                  boxSIZED_15,
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      fillColor: primaryGreen,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      height: 2.5,
                    ),
                  ),
                  boxSIZED_15,
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      fillColor: primaryGreen,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      height: 2.5,
                    ),
                  ),
                  boxSIZED_15,
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: "Date Of Birth",
                      fillColor: primaryGreen,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      height: 2.5,
                    ),
                  ),
                  boxSIZED_15,
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      fillColor: primaryGreen,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      height: 2.5,
                    ),
                  ),
                  boxSIZED_15,
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      fillColor: primaryGreen,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      height: 2.5,
                    ),
                  ),
                  boxSIZED_15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/securityquestscreen",
                          );
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
