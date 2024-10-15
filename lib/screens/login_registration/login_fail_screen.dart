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
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/BioMark.png'),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Too many Failed Attempts !!",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.errorRed,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(
                      color: AppColors.errorRed,
                      decoration: TextDecoration.lineThrough,
                    ),
                    fillColor: AppColors.primaryGreen,
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
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      color: AppColors.errorRed,
                      decoration: TextDecoration.lineThrough,
                    ),
                    fillColor: AppColors.primaryGreen,
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
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/forgotpasswordscreen");
                    },
                    child: const Text(
                      'Forgot Your Password?',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pushNamed(context, "/recoveraccscreen");
                //     },
                //     child: const Text(
                //       'Recover Account?',
                //       style: TextStyle(
                //         color: Colors.red,
                //         decoration: TextDecoration.underline,
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
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
                    // decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black, // Button color (000000)
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    iconColor: Color(0xFFFFFFFF),
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
