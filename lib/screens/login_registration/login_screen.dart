import 'package:biomark/resources/theme.dart';
import 'package:biomark/services/validator_functions.dart';
// import 'package:biomark/widgets/TextFormField.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';
// import '../../services/database_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers for handle email and password.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _loginFormGlobalKey = GlobalKey<FormState>();

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
        backgroundColor: primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  // Space between appBar and image
                  boxSIZED_20,
                  // rounded image
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/BioMark.png',
                    ),
                  ),
                  // Space between image and fields
                  boxSIZED_40,
                  const CommonTopic(
                    topic: "Welcom to Biomark",
                  ),
                  // Space between image and fields
                  boxSIZED_40,
                  Form(
                    key: _loginFormGlobalKey,
                    child: Column(
                      children: [
                        // Email TextFormField
                        TextFormField(
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
                          validator: validateEmail,
                          onSaved: (value) {},
                        ),
                        // Space between Email and Password fields
                        boxSIZED_20,
                        // Password TextField
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            fillColor: primaryGreen,
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
                          obscureText: !_obscurePassword,
                          showCursor: true,
                          validator: validatePassword,
                        ),
                        boxSIZED_20,
                        // Login Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: loginRegistColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            if (_loginFormGlobalKey.currentState!.validate()) {
                              _loginFormGlobalKey.currentState!.save();
                              Navigator.pushNamed(
                                context,
                                "/normalprofilescreen",
                              );
                              setState(() {
                                // logic to handle login with databases.
                              });
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

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
                        Navigator.pushNamed(
                          context,
                          "/loginfailscreen",
                        );
                      },
                      child: const Text(
                        'Login Failed?',
                        style: TextStyle(
                          color: commonRed,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  boxSIZED_10,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/recoveraccscreen",
                        );
                      },
                      child: const Text(
                        'Recover Account?',
                        style: TextStyle(
                          color: commonRed,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  boxSIZED_15,
                  // Horizontal line (Divider) with specific width
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  boxSIZED_15,
                  const Text(
                    'New to Biomark?',
                    style: TextStyle(
                      color: commonRed,
                    ),
                  ),
                  boxSIZED_15,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: loginRegistColor,
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
      ),
    );
  }
}
