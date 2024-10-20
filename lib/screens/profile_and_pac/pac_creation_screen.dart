import 'package:biomark/resources/theme.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';

class PACCreatingScreen extends StatefulWidget {
  const PACCreatingScreen({super.key});

  @override
  State<PACCreatingScreen> createState() => _PACCreatingScreenState();
}

class _PACCreatingScreenState extends State<PACCreatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAC Creation'),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppSizes.size10,
              const CommonTopic(
                topic: "PAC Creation",
              ),
              AppSizes.size40,
              const Text(
                "Answer Following Questions for our Predictive Model building Project. By Doing this You would get awesome benefits in the long run.",
                style: TextStyle(
                  fontSize: 15.0,
                  color: AppColors.smsResendBlue,
                ),
              ),
              AppSizes.size20,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.logoutColor,
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
                    "/pacscreen",
                  );
                },
                child: const Text(
                  "PAC",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                /**
                 * have to be included 
                 * 
                 * 1. Date of Birth text & TextField - most suitable if it is a calendar
                 * 2. Time of Birth text & TextField - most suitable if it has a great way to choose.
                 * 3. Location of Birth text & TextField
                 * 4. Blood Group - most suitable a menu
                 * 5. Sex - most suitable if a menu
                 * 6. Height text & textField
                 * 7. Ethnicity text & TextField
                 * 8. Eye Color - text & TextField
                 * 
                 * at the bottom there should have the Elevated Button named "Create"
                 * It should then navigate to the PAC Account dashboard and there has to be an elevated button named "profile".
                 */
              ),
            ],
          ),
        ),
      ),
    );
  }
}
