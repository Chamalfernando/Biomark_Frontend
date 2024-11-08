import 'package:biomark/resources/theme.dart';
import 'package:biomark/services/validator_functions.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers for handle email and password.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _loginFormGlobalKey = GlobalKey<FormState>();

  bool _obscurePassword = false; // Track the visibility state of the password
  bool _isFormDisabled = false;
  bool _isLoading = false;
  int _failedAttempts = 0;
  final int _maxLoginAttempts = 3; // Maximum login attempts allowed

  Future<void> _loginWithEmailPassword() async {
    if (_loginFormGlobalKey.currentState!.validate()) {
      // Get email and password from controllers
      String email = emailController.text.trim();
      String passWord = passwordController.text.trim();

      setState(() {
        _isLoading = true;
      });

      try {
        // Attempt to sign in with Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: passWord);

        // After successful login, retrieve additional user data from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid) // Get data using user UID
            .get();

        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;

          // You can now access additional fields like fullName, dob, etc.
          var fullName = userData['fullName'];

          // Successful login
          _loginFormGlobalKey.currentState!.reset();
          // Navigate to the user's profile screen or another page
          Navigator.pushNamed(
            // ignore: use_build_context_synchronously
            context,
            "/normalprofilescreen",
            arguments: {
              "userFullName": fullName,
            },
          );
        } else {
          // Handle the case where user data is missing in Firestore
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'User data not found.',
              ),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        // Handle different errors from Firebase
        if (e.code == 'user-not-found') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'No user found with this email',
              ),
            ),
          );
        } else if (e.code == 'wrong-password') {
          setState(() {
            _failedAttempts += 1;
          });

          if (_failedAttempts >= _maxLoginAttempts) {
            // If 3 failed attempts, disable the form and navigate to login failure page
            setState(() {
              _isFormDisabled = true;
            });
            Navigator.pushReplacementNamed(
              // ignore: use_build_context_synchronously
              context,
              "/loginfailscreen",
            );
          } else {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Incorrect password',
                ),
              ),
            );
          }
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error: ${e.message}',
              ),
            ),
          );
        }
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'An error occurred: $e',
            ),
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
                    topic: "Welcome to Biomark",
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
                          keyboardType: TextInputType.emailAddress,
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
                          enabled:
                              !_isFormDisabled, // Disable if max attempts reached
                          validator: validateEmail,
                          onSaved: (value) {
                            emailController.text = value!;
                          },
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
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          enabled:
                              !_isFormDisabled, // Disable if max attempts reached
                        ),
                        boxSIZED_20,
                        _isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
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
                                  _isFormDisabled
                                      ? null
                                      : _loginWithEmailPassword(); // Disable button if form is disabled
                                  // _loginWithEmailPassword();
                                  if (_loginFormGlobalKey.currentState!
                                      .validate()) {
                                    _loginFormGlobalKey.currentState!.save();
                                    _loginFormGlobalKey.currentState!.reset();
                                    // Navigator.pushNamed(
                                    //   context,
                                    //   "/normalprofilescreen",
                                    // );
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
