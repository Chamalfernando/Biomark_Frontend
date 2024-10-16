import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class AccountRecoveryScreen extends StatefulWidget {
  const AccountRecoveryScreen({super.key});

  @override
  State<AccountRecoveryScreen> createState() => _AccountRecoveryScreenState();
}

class _AccountRecoveryScreenState extends State<AccountRecoveryScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController friendNameController = TextEditingController();
  final TextEditingController petNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Recovery'),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20), // Space between appBar and image
                  // rounded image
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/BioMark.png'), // Assuming you have the image in assets folder
                  ),
                  const SizedBox(
                    height: 40,
                  ), // Space between image and fields
                  const Text(
                    "Account Recovery",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: AppColors.topicGreen,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ), // Space between image and fields
                  const Text(
                    "Answer to following security questions",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: AppColors.errorRed,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "1. Full Name Given Previously",
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
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: "Full Name",
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
                      "2. Date of Birth Given Previously",
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
                    controller: dobController,
                    decoration: InputDecoration(
                      labelText: "Date of Birth",
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
                      "3. Childhood Best Friend's Name Given Previously",
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
                    controller: friendNameController,
                    decoration: InputDecoration(
                      labelText: "Childhood Best Friend's Name",
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
                      "4. Childhood Pet's Name Given Previously",
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
                    controller: petNameController,
                    decoration: InputDecoration(
                      labelText: "Childhood Pet's Name",
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
                          "/registrationscreen",
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
            ],
          ),
        ),
      ),
    );
  }
}
