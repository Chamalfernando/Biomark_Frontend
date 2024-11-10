import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class ForgotPassWordInitScreen extends StatefulWidget {
  const ForgotPassWordInitScreen({super.key});

  @override
  State<ForgotPassWordInitScreen> createState() =>
      _ForgotPassWordInitScreenState();
}

class _ForgotPassWordInitScreenState extends State<ForgotPassWordInitScreen> {
  @override
  void initState() {
    super.initState();
    customLogger.i("navigate to the Forgot Password initial screen");
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreen,
        elevation: 0, // Remove shadow for a clean header
        centerTitle: true,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                boxSIZED_30,
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/BioMark.png'),
                ),
                boxSIZED_40,
                const Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: errorRed,
                  ),
                ),
                boxSIZED_20,
                const Text(
                  "Enter your email address to receive a 6-digit verification code.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                boxSIZED_30,
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                  onChanged: (value) {
                    // Add real-time email validation logic here
                  },
                  // have to implement logic for the email validation and email retrieval part.
                ),
                boxSIZED_20,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Logic to handle email submission and loading
                    },
                    child: const Text(
                      "Send Code",
                      style: TextStyle(fontSize: 18, color: whiteColor),
                    ),
                  ),
                ),
                boxSIZED_25,
                Divider(color: Colors.grey.shade400),
                boxSIZED_20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive an email? ",
                      style: TextStyle(color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Logic for resending email
                      },
                      child: const Text(
                        'Resend',
                        style: TextStyle(
                          color: smsResendBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                boxSIZED_20,
                TextField(
                  controller: smsController,
                  decoration: InputDecoration(
                    labelText: "Enter Verification Code",
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                  onChanged: (value) {
                    // Add code validation logic here
                  },
                ),
                boxSIZED_30,
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
                      // Navigate to the next screen or show success
                      Navigator.pushNamed(context, "/forgotpwsecondscreen");
                    },
                    child: const Icon(Icons.arrow_forward, color: whiteColor),
                  ),
                ),
                boxSIZED_40,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
