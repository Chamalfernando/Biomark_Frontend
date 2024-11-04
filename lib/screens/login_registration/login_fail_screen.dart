import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class LoginFailScreen extends StatefulWidget {
  const LoginFailScreen({super.key});

  @override
  State<LoginFailScreen> createState() => _LoginFailScreenState();
}

class _LoginFailScreenState extends State<LoginFailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        backgroundColor: primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                boxSIZED_20,
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/BioMark.png',
                  ),
                ),
                boxSIZED_40,
                const Text(
                  "Too many Failed Attempts !!",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: errorRed,
                  ),
                ),
                boxSIZED_40,
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(
                      color: errorRed,
                      decoration: TextDecoration.lineThrough,
                    ),
                    fillColor: primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                    color: AppColors.errorRed,
                  ),
                  enabled: false,
                ),
                boxSIZED_20,
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      color: errorRed,
                      decoration: TextDecoration.lineThrough,
                    ),
                    fillColor: primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                    color: AppColors.errorRed,
                  ),
                  enabled: false,
                  obscureText: true,
                ),
                boxSIZED_20,
                boxSIZED_25,
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
                        color: commonRed,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                boxSIZED_15,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Divider(
                    color: black,
                    thickness: 2,
                  ),
                ),
                boxSIZED_15,
                const Text(
                  'New to Biomark?',
                  style: TextStyle(
                    color: commonRed,
                    // decoration: TextDecoration.underline,
                  ),
                ),
                boxSIZED_25,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: black, // Button color (000000)
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ), // Button size
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
                      color: whiteColor,
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
