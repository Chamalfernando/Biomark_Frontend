import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/screens/login_registration/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSecondScreen extends StatefulWidget {
  const ForgotPasswordSecondScreen({super.key});

  @override
  State<ForgotPasswordSecondScreen> createState() =>
      _ForgotPasswordSecondScreenState();
}

class _ForgotPasswordSecondScreenState
    extends State<ForgotPasswordSecondScreen> {
  @override
  void initState() {
    super.initState();
    customLogger.i("navigate to the forgot password second screen");
  }

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reTypePasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isRePasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreen,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Reset Password',
          style: TextStyle(color: whiteColor, fontSize: 20),
        ),
      ),
      backgroundColor: whiteColor,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        // decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [primaryGreen.withOpacity(0.9), whiteColor],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        // ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              boxSIZED_30,
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/BioMark.png'),
              ),
              boxSIZED_30,
              Center(
                child: const Text(
                  "Final Step",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: errorRed,
                  ),
                ),
              ),
              boxSIZED_20,
              const Text(
                "Create your new password",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              boxSIZED_20,
              _buildPasswordField(
                  "New Password", passwordController, isPasswordVisible,
                  (isVisible) {
                setState(() {
                  isPasswordVisible = isVisible;
                });
              }),
              boxSIZED_20,
              _buildPasswordField("Retype New Password",
                  reTypePasswordController, isRePasswordVisible, (isVisible) {
                setState(() {
                  isRePasswordVisible = isVisible;
                });
              }),
              boxSIZED_30,
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 16,
                      color: black,
                    ),
                  ),
                ),
              ),
              boxSIZED_25,
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPasswordField(String label, TextEditingController controller,
    bool isVisible, Function(bool) onVisibilityToggle) {
  return TextField(
    controller: controller,
    obscureText: !isVisible,
    decoration: InputDecoration(
      labelText: label,
      suffixIcon: IconButton(
        icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          onVisibilityToggle(!isVisible);
        },
      ),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryGreen),
      ),
    ),
    style: const TextStyle(
      height: 1.5,
      fontSize: 16,
    ),
  );
}
