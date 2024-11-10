import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/services/encyption_service.dart';
import 'package:biomark/services/validator_functions.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    super.initState();
    customLogger.i("navigate to the registration screen");
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _registrationFormGlobalKey = GlobalKey<FormState>();

  bool _obscurePassword = false; // Track the visibility state of the password

  // Function to show DatePicker and handle selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date as default
      firstDate: DateTime(1900), // Start date limit
      lastDate: DateTime.now(), // End date limit
    );

    if (pickedDate != null) {
      // Format the selected date
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      setState(
        () {
          dobController.text =
              formattedDate; // Update the TextFormField with selected date
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
        backgroundColor: primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  boxSIZED_20,
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/BioMark.png',
                    ),
                  ),
                  boxSIZED_40,
                  const CommonTopic(
                    topic: "Sign Up",
                  ),
                  boxSIZED_20,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Provide information for SignUp",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: black,
                      ),
                    ),
                  ),
                  boxSIZED_10,
                  Form(
                    key: _registrationFormGlobalKey,
                    child: Column(
                      children: [
                        // TextFormField(
                        //   controller: firstNameController,
                        //   decoration: InputDecoration(
                        //     labelText: "First Name",
                        //     fillColor: primaryGreen,
                        //     filled: true,
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     prefixIcon: const Icon(
                        //       Icons.person,
                        //     ),
                        //   ),
                        //   style: const TextStyle(
                        //     height: 2.5,
                        //   ),
                        //   validator: (value) => validateFirstName(value),
                        //   onSaved: (value) {
                        //     firstNameController.text = value!;
                        //   },
                        // ),
                        // boxSIZED_15,
                        // TextFormField(
                        //   controller: lastNameController,
                        //   decoration: InputDecoration(
                        //     labelText: "Last Name",
                        //     fillColor: primaryGreen,
                        //     filled: true,
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     prefixIcon: const Icon(
                        //       Icons.person_2,
                        //     ),
                        //   ),
                        //   style: const TextStyle(
                        //     height: 2.5,
                        //   ),
                        //   validator: (value) => validateLastName(value),
                        //   onSaved: (value) {
                        //     lastNameController.text = value!;
                        //   },
                        // ),
                        boxSIZED_15,
                        TextFormField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            fillColor: primaryGreen,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_3,
                            ),
                          ),
                          style: const TextStyle(
                            height: 2.5,
                          ),
                          onSaved: (value) {
                            fullNameController.text = value!;
                          },
                          validator: (value) {
                            // return validateFullName(
                            //     value,
                            //     firstNameController.text,
                            //     lastNameController.text);
                            return validateFullName(value);
                          },
                        ),
                        boxSIZED_15,
                        TextFormField(
                          controller: dobController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: "Date Of Birth",
                            fillColor: primaryGreen,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () {
                                _selectDate(
                                  context,
                                ); // Open the date picker when the icon is tapped
                              },
                            ),
                          ),
                          // readOnly: true, // Prevent user from manually editing the date
                          style: const TextStyle(
                            height: 2.5,
                          ),
                          onSaved: (value) {
                            dobController.text = value!;
                          },
                          validator: (value) => validateDOB(value),
                        ),
                        boxSIZED_15,
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            fillColor: primaryGreen,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.email,
                            ),
                          ),
                          style: const TextStyle(
                            height: 2.5,
                          ),
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          validator: validateEmail,
                        ),
                        boxSIZED_15,
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            fillColor: primaryGreen,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.password,
                            ),
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
                        ),
                        boxSIZED_15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
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
                                if (_registrationFormGlobalKey.currentState!
                                    .validate()) {
                                  _registrationFormGlobalKey.currentState!
                                      .save();
                                  // _registrationFormGlobalKey.currentState!
                                  //     .reset();

                                  // Navigate to SecurityQuestionsScreen with the collected form data
                                  Navigator.pushNamed(
                                    context,
                                    "/securityquestscreen",
                                    arguments: {
                                      // 'firstName': firstNameController.text,
                                      // 'lastName': lastNameController.text,
                                      'fullName': fullNameController.text,
                                      'dob': dobController.text,
                                      'email': emailController.text,
                                      'pw': passwordController.text,
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                "Next",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
