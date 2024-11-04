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
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: logoutColor,
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
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              boxSIZED_40,
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profileImg.png'),
                ),
              ),
              boxSIZED_20,
              const CommonTopic(
                topic: "PAC",
              ),
              boxSIZED_40,
              /**
               * 
               * text - "Currently We don’t have any 
                    prediction models built from 
                    our organization." - smsblue color
                AppSizes.size20


                Text - "Subscribe to our service for 
provide additional information" - black color - size25

                Elevated Button - Subscribe - black color

                Text - "Currently addtional detail providing is under maintenance."

                horizontal line 

                Elevated Button - Go to profile.
               */
            ],
          ),
        ),
      ),
    );
  }
}
