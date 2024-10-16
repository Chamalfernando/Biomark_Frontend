import 'package:biomark/resources/theme.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';

class PACScreen extends StatelessWidget {
  const PACScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAC'),
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
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
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
                        // Navigator.pushNamed(
                        //   context,
                        //   "/registrationscreen",
                        // );
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppSizes.size40,
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profileImg.png'),
                ),
              ),
              AppSizes.size20,
              const CommonTopic(
                topic: "PAC",
              ),
              AppSizes.size40,
            ],
          ),
        ),
      ),
    );
  }
}
