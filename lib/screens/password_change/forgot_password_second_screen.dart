import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSecondScreen extends StatefulWidget {
  const ForgotPasswordSecondScreen({super.key});

  @override
  State<ForgotPasswordSecondScreen> createState() =>
      _ForgotPasswordSecondScreenState();
}

class _ForgotPasswordSecondScreenState
    extends State<ForgotPasswordSecondScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reTypePasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password 2'),
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
                  "Final Step",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: AppColors.errorRed,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your new password here",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
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
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ReEnter your new password here",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: reTypePasswordController,
                  decoration: InputDecoration(
                    labelText: "Retype Password",
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
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
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
                      "Enter",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pushNamed(context, "/forgotpasswordscreen");
                //     },
                //     child: const Text(
                //       'Forgot Your Password?',
                //       style: TextStyle(
                //         color: Colors.red,
                //         decoration: TextDecoration
                //             .underline, // Underline the text to make it look like a link
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pushNamed(context, "/loginfailscreen");
                //     },
                //     child: const Text(
                //       'Login Failed?',
                //       style: TextStyle(
                //         color: Colors.red,
                //         decoration: TextDecoration.underline,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
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
                // const SizedBox(
                //   height: 15,
                // ),
                // Horizontal line (Divider) with specific width
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   child: const Divider(
                //     color: Colors.black,
                //     thickness: 2,
                //   ),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                // const Text(
                //   'New to Biomark?',
                //   style: TextStyle(
                //     color: Colors.red,
                //   ),
                // ),
                // const SizedBox(
                //   height: 25,
                // ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: AppColors.black,
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 40, vertical: 15),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(
                //       context,
                //       "/registrationscreen",
                //     );
                //   },
                //   child: const Text(
                //     "SignUp",
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
