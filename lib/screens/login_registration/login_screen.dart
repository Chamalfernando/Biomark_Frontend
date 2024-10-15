import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';
import '../../services/database_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true; // Track the visibility state of the password

  // void _login() async {
  //   String email = emailController.text;
  //   String password = passwordController.text;

  //   var dbHelper = DatabaseHelper.instance;
  //   var user = await dbHelper.getUser(email, password);

  //   if (user != null) {
  //     Navigator.pushReplacementNamed(context, '/registrationscreen');
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Invalid login')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 20), // Space between appBar and image
                // rounded image
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/BioMark.png'), // Assuming you have the image in assets folder
                ),
                const SizedBox(
                  height: 40,
                ), // Space between image and fields
                const Text(
                  "Welcome to Biomark",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.topicGreen,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ), // Space between image and fields
                // Email TextField
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    fillColor: AppColors.primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ), // Space between Email and Password fields
                // Password TextField
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    fillColor: AppColors.primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // Add the eye icon in the suffixIcon
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Change the icon based on the password visibility state
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // Toggle the password visibility state
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                  ),
                  obscureText: _obscurePassword, // control password visibility
                  showCursor: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
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
                      "/normalprofilescreen",
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/forgotpasswordscreen",
                      );
                    },
                    child: const Text(
                      'Forgot Your Password?',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration
                            .underline, // Underline the text to make it look like a link
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/loginfailscreen");
                    },
                    child: const Text(
                      'Login Failed?',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/recoveraccscreen");
                    },
                    child: const Text(
                      'Recover Account?',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Horizontal line (Divider) with specific width
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'New to Biomark?',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/registrationscreen",
                    );
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
