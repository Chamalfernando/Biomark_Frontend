import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class ForgotPassWordInitScreen extends StatefulWidget {
  const ForgotPassWordInitScreen({super.key});

  @override
  State<ForgotPassWordInitScreen> createState() =>
      _ForgotPassWordInitScreenState();
}

class _ForgotPassWordInitScreenState extends State<ForgotPassWordInitScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password 1'),
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
                  "Forgot Password ?",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: errorRed,
                  ),
                ),
                boxSIZED_40,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Provide your email and we'll send a six digit code to verify.",
                  ),
                ),
                boxSIZED_10,
                TextField(
                  controller: emailController,
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
                  // have to implement logic for the email validation and email retrieval part.
                ),
                boxSIZED_20,
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
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
                      setState(() {});

                      //TODO have to get a notification or a popup msg of a code.
                    },
                    child: const Text(
                      "Enter",
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                // Login Button

                boxSIZED_25,

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Divider(
                    color: black,
                    thickness: 2,
                  ),
                ),
                boxSIZED_10,
                Row(
                  children: [
                    const Text(
                      "Didn't receive an email msg? ",
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, "/recoveraccscreen");
                      },
                      child: const Text(
                        'Resend Email',
                        style: TextStyle(
                          color: smsResendBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                boxSIZED_15,
                TextField(
                  controller: smsController,
                  decoration: InputDecoration(
                    labelText: "Enter Code here",
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

                boxSIZED_25,
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
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
                        "/forgotpwsecondscreen",
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward,
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
