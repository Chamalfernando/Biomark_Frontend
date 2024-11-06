import 'package:biomark/models/user.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/services/hive_database_helper.dart';
import 'package:biomark/services/validator_functions.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';

class SecurityQuestionsScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String fullName;
  final String dob;
  final String email;
  final String passWord;

  const SecurityQuestionsScreen({
    super.key,
    required this.firstName,
    required this.lastName,
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
  final TextEditingController mMaidenNameController = TextEditingController();
  final TextEditingController childrBestFriendNameController =
      TextEditingController();
  final TextEditingController childPetNameController = TextEditingController();
  final TextEditingController customQuestController = TextEditingController();
  final TextEditingController customAnsController = TextEditingController();
  final _securityQuestionsFormGlobalKey = GlobalKey<FormState>();

  // Function to submit form data to SQLite
  Future<void> _submitDataToDB() async {
    if (_securityQuestionsFormGlobalKey.currentState!.validate()) {
      _securityQuestionsFormGlobalKey.currentState!.save();

      // Create a new user object
      User newUser = User(
        firstName: widget.firstName,
        lastName: widget.lastName,
        fullName: widget.fullName,
        dob: widget.dob,
        email: widget.email,
        password: widget.passWord,
        maidenName: mMaidenNameController.text,
        bestFriendName: childrBestFriendNameController.text,
        petName: childPetNameController.text,
        customQuestion: customQuestController.text,
        customAnswer: customAnsController.text,
      );

      // Save user data
      await saveUser(newUser, context);

      // After successful insertion, show a confirmation message or navigate to another screen
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'User data successfully saved!',
          ),
        ),
      );

      // Optionally navigate to another screen or clear the form
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Questions'),
        backgroundColor: primaryGreen,
        centerTitle: true,
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
                Text('First Name: ${widget.firstName}'),
                Text('Last Name: ${widget.lastName}'),
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
