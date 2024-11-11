import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';

class AccountRecoveryScreen extends StatefulWidget {
  const AccountRecoveryScreen({super.key});

  @override
  State<AccountRecoveryScreen> createState() => _AccountRecoveryScreenState();
}

class _AccountRecoveryScreenState extends State<AccountRecoveryScreen> {
  @override
  void initState() {
    super.initState();
    customLogger.i("navigate to the account recovery screen");
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController friendNameController = TextEditingController();
  final TextEditingController petNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Recovery'),
        backgroundColor: primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              boxSIZED_20,
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/BioMark.png'),
              ),
              boxSIZED_40,
              const CommonTopic(
                topic: "Account Recovery",
              ),
              boxSIZED_20,
              const Text(
                "Please answer the following security questions to recover your account.",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              boxSIZED_20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Full Name Given Earlier",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: black,
                    ),
                  ),
                  boxSIZED_10,
                  _buildTextField(fullNameController, "Enter your full name"),
                  boxSIZED_20,
                  Text(
                    "2. Date of Birth Provided Earlier",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: black,
                    ),
                  ),
                  boxSIZED_10,
                  _buildDatePicker(
                      dobController, context, "Select your date of birth"),
                  boxSIZED_20,
                  Text(
                    "3. Childhood Best Friend's Name",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: black,
                    ),
                  ),
                  boxSIZED_10,
                  _buildTextField(
                      friendNameController, "Enter your best friend's name"),
                  boxSIZED_20,
                  Text(
                    "4. Childhood Pet's Name",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: black,
                    ),
                  ),
                  boxSIZED_10,
                  _buildTextField(petNameController, "Enter your pet's name"),
                  boxSIZED_30,
                ],
              ),
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
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/normalprofilescreen",
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
    );
  }
}

// Helper method to build text fields
Widget _buildTextField(TextEditingController controller, String hintText) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: hintText,
      fillColor: primaryGreen.withOpacity(0.1),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "Provide a Value";
      } else {
        return null;
      }
    },
  );
}

// Helper method for date picker field
Widget _buildDatePicker(
    TextEditingController controller, BuildContext context, String hintText) {
  return GestureDetector(
    onTap: () async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (pickedDate != null) {
        controller.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      }
    },
    child: AbsorbPointer(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          fillColor: primaryGreen.withOpacity(0.1),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(Icons.calendar_month),
        ),
      ),
    ),
  );
}
