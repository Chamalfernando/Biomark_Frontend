import 'dart:convert';
import 'package:biomark/resources/logger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:biomark/resources/theme.dart';
import 'package:biomark/services/validator_functions.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PACCreatingScreen extends StatefulWidget {
  const PACCreatingScreen({
    super.key,
  });

  @override
  State<PACCreatingScreen> createState() => _PACCreatingScreenState();
}

class _PACCreatingScreenState extends State<PACCreatingScreen> {
  @override
  void initState() {
    super.initState();
    customLogger.i("navigate to the PAC creation screen");
  }

  // final prefs = SharedPreferences.getInstance();
  //   customLogger.i(prefs.getString("userUniqueId"));
  //   customLogger.i(prefs.getString("ROLE_1"));
  //   customLogger.i(prefs.getBool("ROLE_2"));

  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController timeOfBirthController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String? selectedBloodGroup;
  String? selectedSex;
  String? selectedEthnicity;
  String? selectedEyeColor;

  final _pacCreationFormGlobalKey = GlobalKey<FormState>();

  // Dropdown values
  int selectedFeet = 3;
  int selectedInches = 0;

  // Feet and Inches dropdown options
  final List<int> feetOptions =
      List.generate(8, (index) => index + 1); // From 1 to 8 feet
  final List<int> inchOptions =
      List.generate(12, (index) => index); // From 0 to 11 inches

  // Convert feet and inches to meters for validation
  double heightInMeters() {
    return (selectedFeet * 0.3048) + (selectedInches * 0.0254);
  }

  // Validate height
  String? validateHeight() {
    double height = heightInMeters();
    double minHeight = 0.55; // Shortest man height in meters
    double maxHeight = 2.52; // Tallest man height in meters

    if (height < minHeight) {
      return 'Height is too short to be realistic';
    } else if (height > maxHeight) {
      return 'Height is too tall to be realistic';
    }
    return null; // Return null if valid
  }

  // Function to show DatePicker and handle selected date
  Future<void> _selectDateForCalendar(BuildContext context) async {
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
          dateOfBirthController.text =
              formattedDate; // Update the TextFormField with selected date
        },
      );
    }
  }

  // Function to show TimePicker and handle selected time
  Future<void> _selectTimeForClock(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Update the controller with the formatted time string
      setState(
        () {
          timeOfBirthController.text =
              pickedTime.format(context); // Stores time as a string
        },
      );
    }
  }

  // Submit data to the backend (Express.js)
  Future<void> submitData() async {
    if (_pacCreationFormGlobalKey.currentState!.validate()) {
      _pacCreationFormGlobalKey.currentState!.save();

      // have to create a unique id in order to identify each user data object and it has to be saved in the user session.
      // Gather form data
      final formData = {
        'dateOfBirth': dateOfBirthController.text,
        'timeOfBirth': timeOfBirthController.text,
        'location': locationController.text,
        'bloodGroup': selectedBloodGroup,
        'sex': selectedSex,
        'heightInMeters': heightInMeters().toString(),
        'ethnicity': selectedEthnicity,
        'eyeColor': selectedEyeColor
      };

      // Send data to Express.js backend
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/pac-create'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(formData),
      );

      if (response.statusCode == 201) {
        // Extract the uniqueId from the response
        final responseData = jsonDecode(response.body);
        final uniqueId = responseData['uniqueId'];

        // Save the uniqueId in SharedPreferences & logic to change the role as volunteer
        final prefs = await SharedPreferences.getInstance();
        if (prefs.getString("userUniqueId") == "NULL") {
          await prefs.setString("userUniqueId", uniqueId);
          // Save the role as VOLUNTEER and set ROLE_2 to true
          await prefs.setBool(
              'ROLE_2', true); // Set ROLE_2 to true in SharedPreferences
          await prefs.setString("ROLE_1", "VOLUNTEER");
          customLogger.i(prefs.getString("userUniqueId"));
          // print(prefs.getString("userUniqueId"));
          customLogger.i(prefs.getString("ROLE_1"));
          // print(prefs.getString("ROLE_1"));
          customLogger.i(prefs.getBool("ROLE_2"));
          // print(prefs.getString("ROLE_2"));
        } else {
          customLogger.i("Already set up the user unique ID");
          // print("Already set up the user unique ID");
        }

        // Handle success
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'PAC creation successful! You are now a volunteer.',
            ),
          ),
        );
        Navigator.pushNamed(
          // ignore: use_build_context_synchronously
          context,
          "/pacscreen",
        );
      } else {
        // Handle error
        customLogger.e("Error when creating pac");
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to create PAC. Try again.',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('PAC Creation'),
        backgroundColor: primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              boxSIZED_10,
              const CommonTopic(
                topic: "PAC Creation",
              ),
              Column(
                children: [
                  boxSIZED_40,
                  const Text(
                    "Answer Following Questions for our Predictive Model building Project. By Doing this You would get awesome benefits in the long run.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: smsResendBlue,
                    ),
                  ),
                  boxSIZED_20,
                ],
              ),
              Form(
                key: _pacCreationFormGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: dateOfBirthController,
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
                            _selectDateForCalendar(
                              context,
                            ); // Open the date picker when the icon is tapped
                          },
                        ),
                      ),
                      // readOnly: true, // Prevent user from manually editing the date
                      // style: const TextStyle(
                      //   height: 2.5,
                      // ),
                      onSaved: (value) {
                        dateOfBirthController.text = value!;
                      },
                      validator: (value) => validateDOB(value),
                    ),
                    boxSIZED_20,
                    // Time of Birth
                    TextFormField(
                      controller: timeOfBirthController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Time Of Birth",
                        fillColor: primaryGreen,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.access_time,
                          ),
                          onPressed: () {
                            _selectTimeForClock(context);
                          },
                        ),
                      ),
                      validator: (value) => validateTimeOfBirth(value),
                    ),
                    boxSIZED_20,
                    // Location of Birth
                    TextFormField(
                      controller: locationController,
                      decoration: InputDecoration(
                        labelText: "Location Of Birth",
                        fillColor: primaryGreen,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) => validateLocation(value!),
                    ),
                    boxSIZED_20,
                    // Blood Group Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedBloodGroup,
                      decoration: InputDecoration(
                        labelText: "Blood Group",
                        fillColor: primaryGreen,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: [
                        'A+',
                        'A-',
                        'B+',
                        'B-',
                        'AB+',
                        'AB-',
                        'O+',
                        'O-',
                      ]
                          .map(
                            (bloodGroup) => DropdownMenuItem<String>(
                              value: bloodGroup,
                              child: Text(bloodGroup),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            selectedBloodGroup = value;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your blood group';
                        }
                        return null;
                      },
                    ),
                    boxSIZED_20,
                    // Sex Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedSex,
                      decoration: InputDecoration(
                        labelText: "Sex",
                        fillColor: primaryGreen,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: [
                        'Male',
                        'Female',
                        'Prefer Not to Say',
                      ]
                          .map(
                            (sex) => DropdownMenuItem<String>(
                              value: sex,
                              child: Text(sex),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            selectedSex = value;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your sex';
                        }
                        return null;
                      },
                    ),
                    boxSIZED_20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Height (in Feet and Inches)',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        boxSIZED_15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Dropdown for Feet
                            Expanded(
                              child: DropdownButtonFormField<int>(
                                value: selectedFeet,
                                decoration: InputDecoration(
                                  labelText: 'Feet',
                                  fillColor: primaryGreen,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (int? newValue) {
                                  setState(
                                    () {
                                      selectedFeet = newValue!;
                                    },
                                  );
                                },
                                items: feetOptions.map(
                                  (int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        '$value',
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            boxSIZEDW_15, // Space between the dropdowns
                            // Dropdown for Inches
                            Expanded(
                              child: DropdownButtonFormField<int>(
                                value: selectedInches,
                                decoration: InputDecoration(
                                  labelText: 'Inches',
                                  fillColor: primaryGreen,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (int? newValue) {
                                  setState(
                                    () {
                                      selectedInches = newValue!;
                                    },
                                  );
                                },
                                items: inchOptions.map(
                                  (int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(
                                        '$value',
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        ),
                        // boxSIZED_15,
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // Call validateHeight on button press
                        //     String? validationMessage = validateHeight();
                        //     if (validationMessage != null) {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(
                        //           content: Text(
                        //             validationMessage,
                        //           ),
                        //         ),
                        //       );
                        //     } else {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(
                        //           content: Text(
                        //             "Height is valid!",
                        //           ),
                        //         ),
                        //       );
                        //     }
                        //   },
                        //   child: Text(
                        //     'Submit',
                        //   ),
                        // ),
                      ],
                    ),
                    boxSIZED_20,
                    // Ethnicity Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedEthnicity,
                      decoration: InputDecoration(
                        labelText: "Ethnicity",
                        fillColor: primaryGreen,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: [
                        'Sinhalese',
                        'Tamil',
                        'Muslim',
                        'Other',
                      ]
                          .map(
                            (ethnicity) => DropdownMenuItem<String>(
                              value: ethnicity,
                              child: Text(ethnicity),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            selectedEthnicity = value;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your ethnicity';
                        }
                        return null;
                      },
                    ),
                    boxSIZED_20,
                    // Eye Color Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedEyeColor,
                      decoration: InputDecoration(
                        labelText: "Eye Color",
                        fillColor: primaryGreen,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: [
                        'Brown',
                        'Blue',
                        'Green',
                        'Gray',
                        'Hazel',
                        'Amber',
                      ]
                          .map(
                            (eyeColor) => DropdownMenuItem<String>(
                              value: eyeColor,
                              child: Text(eyeColor),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            selectedEyeColor = value!;
                          },
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your eye color';
                        }
                        return null;
                      },
                    ),
                    boxSIZED_40,
                    // Create Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: logoutColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_pacCreationFormGlobalKey.currentState!
                            .validate()) {
                          Navigator.pushNamed(
                            context,
                            "/pacscreen",
                          );
                        }
                        submitData();
                      },
                      child: const Text(
                        "Create PAC",
                        style: TextStyle(
                          color: whiteColor,
                        ),
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
