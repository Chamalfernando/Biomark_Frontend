import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class NormalProfileScreen extends StatefulWidget {
  const NormalProfileScreen({super.key});

  @override
  State<NormalProfileScreen> createState() => _NormalProfileScreenState();
}

class _NormalProfileScreenState extends State<NormalProfileScreen> {
  final String _fullName = "John Doe";
  final String _email = "johnDoe@hotmail.com";
  final String _dob = "20/09/1970";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primaryGreen,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profileImg.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            "Hi There !!",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: AppColors.topicGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            _fullName,
                            style: const TextStyle(
                              fontSize: 25.0,
                              color: AppColors.topicGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Full Name : $_fullName",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: AppColors.topicGreen,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Email : $_email",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: AppColors.topicGreen,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Date Of Birth : $_dob",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: AppColors.topicGreen,
                        ),
                      ),
                    ],
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
