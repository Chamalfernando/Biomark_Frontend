import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/services/backend_service.dart';
import 'package:biomark/services/validator_functions.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    customLogger.i("navigate to the login screen");
  }

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
      checkUserRole();
      checkUserVolunteer();
      final preferences = await SharedPreferences.getInstance();
      if (preferences.getString("userUniqueId") != "NULL") {
        customLogger.i(preferences.getString("userUniqueId"));
      }
      customLogger.i(preferences.getString("ROLE_1"));
      customLogger.i(preferences.getBool("ROLE_2"));
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
          // Map<String, dynamic> userData =
          //     userDoc.data() as Map<String, dynamic>;

          // You can now access additional fields like fullName, dob, etc.
          // var fullName = userData['fullName'];

          // Successful login
          _loginFormGlobalKey.currentState!.reset();
          // Navigate to the user's profile screen or another page
          Navigator.pushNamed(
            // ignore: use_build_context_synchronously
            context,
            "/normalprofilescreen",
            arguments: {
              'authMail': email,
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
        backgroundColor: primaryGreen,
        centerTitle: true,
        automaticallyImplyLeading: false, // Removes the back button
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boxSIZED_20,
              // Hero section with logo
              Center(
                child: Column(
                  children: [
                    // Space between appBar and image
                    // boxSIZED_20,
                    // rounded image
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/BioMark.png'),
                    ),
                    // Space between image and fields
                    boxSIZED_20,
                    // const CommonTopic(
                    //   topic: "Welcome to Biomark",
                    // ),
                    const Text(
                      "Welcome to BioMark",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: primaryGreen,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Space between image and fields
                    boxSIZED_10,
                    const Text(
                      "Sign in to continue",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(224, 117, 117, 117),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // boxSIZED_25,
                  ],
                ),
              ),
              boxSIZED_40,
              Form(
                key: _loginFormGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email TextFormField
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(color: black),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
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
                        labelStyle: const TextStyle(color: black),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
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
                    Center(
                      child: _isLoading
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
                                elevation: 5,
                              ),
                              onPressed: () {
                                if (!_isFormDisabled) {
                                  if (_loginFormGlobalKey.currentState!
                                      .validate()) {
                                    _loginFormGlobalKey.currentState!.save();
                                    _loginWithEmailPassword();
                                  }
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              boxSIZED_20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushNamed(
                  //       context,
                  //       "/forgotpasswordscreen",
                  //     );
                  //   },
                  //   child: const Text(
                  //     'Forgot Your Password?',
                  //     style: TextStyle(
                  //       color: commonRed,
                  //       decoration: TextDecoration
                  //           .underline, // Underline the text to make it look like a link
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
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
                ],
              ),
              boxSIZED_25,
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    boxSIZED_15,
                    const Text(
                      'New to Biomark?',
                      style: TextStyle(
                        color: commonRed,
                        fontSize: 16.0,
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
                        elevation: 5,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/registrationscreen",
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
