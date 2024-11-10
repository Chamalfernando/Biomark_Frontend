import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/services/encyption_service.dart';
import 'package:biomark/services/validator_functions.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

class SecurityQuestionsScreen extends StatefulWidget {
  // final String firstName;
  // final String lastName;
  final String fullName;
  final String dob;
  final String email;
  final String passWord;

  const SecurityQuestionsScreen({
    super.key,
    // required this.firstName,
    // required this.lastName,
    required this.fullName,
    required this.dob,
    required this.email,
    required this.passWord,
  });

  @override
  State<SecurityQuestionsScreen> createState() =>
      _SecurityQuestionsScreenState();
}

class _SecurityQuestionsScreenState extends State<SecurityQuestionsScreen> {
  @override
  void initState() {
    super.initState();
    customLogger.i("navigate to the Security Questions screen");
  }

  final TextEditingController mMaidenNameController = TextEditingController();
  final TextEditingController childrBestFriendNameController =
      TextEditingController();
  final TextEditingController childPetNameController = TextEditingController();
  final TextEditingController customQuestController = TextEditingController();
  final TextEditingController customAnsController = TextEditingController();
  final _securityQuestionsFormGlobalKey = GlobalKey<FormState>();

  // Function to submit form data to FireStore and save user role in SharedPreferences
  Future<void> _submitDataToDB() async {
    if (_securityQuestionsFormGlobalKey.currentState!.validate()) {
      _securityQuestionsFormGlobalKey.currentState!.save();

      String email = widget.email;
      String passWord = widget.passWord;
      final String userRole =
          "GENERALUSER"; // The role you want to assign to the user
      bool isVolunteer = false;

      try {
        // Create user in Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: passWord);

        // Encrypt sensitive data
        // String encFullName = EncryptionService.encrypt(widget.fullName);
        // String encDateOfBirth = EncryptionService.encrypt(widget.dob);
        // String encMaidenName =
        //     EncryptionService.encrypt(mMaidenNameController.text);
        // String encBestFriendName =
        //     EncryptionService.encrypt(childrBestFriendNameController.text);
        // String encPetName =
        //     EncryptionService.encrypt(childPetNameController.text);
        // String encCustomQuestion =
        //     EncryptionService.encrypt(customQuestController.text);
        // String encCustomAnswer =
        //     EncryptionService.encrypt(customAnsController.text);
        // String encEmail = EncryptionService.encrypt(email);
        // String encPassWord = EncryptionService.encrypt(passWord);

        // After successfully creating the Firebase Authentication user,
        // store additional user information in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          // 'firstName': widget.firstName,
          // 'lastName': widget.lastName,
          'fullName': widget.fullName,
          'dob': widget.dob,
          'email': email,
          'passWord': passWord,
          'maidenName': mMaidenNameController.text,
          'bestFriendName': childrBestFriendNameController.text,
          'petName': childPetNameController.text,
          'customQuestion': customQuestController.text,
          'customAnswer': customAnsController.text,
          'role': userRole, // Save the user as a general user.
          'volunteer': isVolunteer,
        });

        // Save user role in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('ROLE_1', userRole);
        await prefs.setBool("ROLE_2", isVolunteer);
        await prefs.setString("userUniqueId", "NULL");

        customLogger.i(prefs.getString("ROLE_1"));
        customLogger.i(prefs.getBool("ROLE_2"));
        customLogger.i(prefs.getString("userUniqueId"));

        // After successful insertion, show a confirmation message
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'User data successfully saved!',
            ),
          ),
        );

        // Optionally navigate to another screen
        Navigator.pushReplacementNamed(
          // ignore: use_build_context_synchronously
          context,
          "/login",
        );
      } on FirebaseAuthException catch (e) {
        // Handle errors (e.g., email already in use, invalid password)
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to save user data: $e',
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
        title: const Text(
          'Security Questions',
        ),
        backgroundColor: primaryGreen,
        centerTitle: true,
        automaticallyImplyLeading: false, // Removes the back button
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _securityQuestionsFormGlobalKey,
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
                // Text('First Name: ${widget.firstName}'),
                // Text('Last Name: ${widget.lastName}'),
                Text('Full Name: ${widget.fullName}'),
                Text('Date of Birth: ${widget.dob}'),
                Text('Email: ${widget.email}'),
                Text('PassWord: ${widget.passWord}'),
                const CommonTopic(
                  topic: "Security Questions",
                ),
                boxSIZED_20,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "1. Mother’s Maiden Name",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: black,
                    ),
                  ),
                ),
                boxSIZED_10,
                TextFormField(
                  controller: mMaidenNameController,
                  decoration: InputDecoration(
                    hintText: "Nilanthi",
                    fillColor: primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                  ),
                  // validator: ,
                  // onSaved: ,
                ),
                boxSIZED_15,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "2. Childhood Best Friend's Name",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: black,
                    ),
                  ),
                ),
                boxSIZED_10,
                TextFormField(
                  controller: childrBestFriendNameController,
                  decoration: InputDecoration(
                    hintText: "Doveen",
                    fillColor: primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                  ),
                  // validator: ,
                  // onSaved: ,
                ),
                boxSIZED_15,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "3. Childhood Pet's Name",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: black,
                    ),
                  ),
                ),
                boxSIZED_10,
                TextFormField(
                  controller: childPetNameController,
                  decoration: InputDecoration(
                    hintText: "Maxxie",
                    fillColor: primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                  ),
                  // validator: ,
                  // onSaved: ,
                ),
                boxSIZED_15,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "4. Your Custom Question & Answer",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: black,
                    ),
                  ),
                ),
                boxSIZED_10,
                TextFormField(
                  controller: customQuestController,
                  decoration: InputDecoration(
                    hintText: "Question",
                    // labelText: "Question",
                    fillColor: primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                  ),
                  // validator: ,
                  // onSaved: ,
                ),
                boxSIZED_10,
                TextFormField(
                  controller: customAnsController,
                  decoration: InputDecoration(
                    hintText: "Answer",
                    // labelText: "Answer",
                    fillColor: primaryGreen,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    height: 2.5,
                  ),
                  // validator: ,
                  // onSaved: ,
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
                    onPressed: () async {
                      _submitDataToDB();
                      Navigator.pushNamed(
                        context,
                        "/login",
                      );
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
