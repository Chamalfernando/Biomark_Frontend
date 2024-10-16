import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class SecurityquestionsScreen extends StatefulWidget {
  const SecurityquestionsScreen({super.key});

  @override
  State<SecurityquestionsScreen> createState() =>
      _SecurityquestionsScreenState();
}

class _SecurityquestionsScreenState extends State<SecurityquestionsScreen> {
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
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/BioMark.png'),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Security Questions",
                style: TextStyle(
                  fontSize: 25.0,
                  color: AppColors.topicGreen,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: mMaidenNameController,
                decoration: InputDecoration(
                  // labelText: "Full Name",
                  fillColor: AppColors.primaryGreen,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(
                  height: 2.5,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "2. Childhood Best Friend's Name",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: childrBestFriendNameController,
                decoration: InputDecoration(
                  // labelText: "Date of Birth",
                  fillColor: AppColors.primaryGreen,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(
                  height: 2.5,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "3. Childhood Pet's Name",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: childPetNameController,
                decoration: InputDecoration(
                  // labelText: "Childhood Best Friend's Name",
                  fillColor: AppColors.primaryGreen,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(
                  height: 2.5,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "4. Your Custom Question & Answer",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: customQuestController,
                decoration: InputDecoration(
                  labelText: "Question",
                  fillColor: AppColors.primaryGreen,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(
                  height: 2.5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: customAnsController,
                decoration: InputDecoration(
                  labelText: "Answer",
                  fillColor: AppColors.primaryGreen,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(
                  height: 2.5,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/normalprofilescreen",
                    );
                  },
                  child: const Text(
                    "Enter",
                    style: TextStyle(
                      color: Colors.white,
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
