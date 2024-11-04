import 'package:biomark/resources/theme.dart';
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
              // Text('Email: ${widget.fullName}'),
              // Text('Date of Birth: ${widget.dob}'),
              // Text('Email: ${widget.email}'),
              // Text('PassWord: ${widget.passWord}'),
              const CommonTopic(
                topic: "Security Questions",
              ),
              boxSIZED_20,
              // const Text(
              //   "Answer to following security questions",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     color: AppColors.errorRed,
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
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
              TextField(
                controller: mMaidenNameController,
                decoration: InputDecoration(
                  // labelText: "Full Name",
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
              TextField(
                controller: childrBestFriendNameController,
                decoration: InputDecoration(
                  // labelText: "Date of Birth",
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
              TextField(
                controller: childPetNameController,
                decoration: InputDecoration(
                  // labelText: "Childhood Best Friend's Name",
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
              TextField(
                controller: customQuestController,
                decoration: InputDecoration(
                  labelText: "Question",
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
              boxSIZED_10,
              TextField(
                controller: customAnsController,
                decoration: InputDecoration(
                  labelText: "Answer",
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
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/login",
                    );
                  },
                  child: const Text(
                    "Enter",
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
    );
  }
}
