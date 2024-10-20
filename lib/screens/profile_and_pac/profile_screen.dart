import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class NormalProfileScreen extends StatefulWidget {
  const NormalProfileScreen({super.key});

  @override
  State<NormalProfileScreen> createState() => _NormalProfileScreenState();
}

class _NormalProfileScreenState extends State<NormalProfileScreen> {
  final String _fullName = "John Doe John Doe John Doe John Doe";
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
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _fullName,
                              style: const TextStyle(
                                fontSize: 25.0,
                                color: AppColors.topicGreen,
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppSizes.size20,
              const SizedBox(
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              AppSizes.size15,
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "Full Name: ", // First part of the text
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: AppColors
                                      .black, // Color for the first part
                                ),
                              ),
                              TextSpan(
                                text: _fullName,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: AppColors
                                      .smsResendBlue, // Color for the second part
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSizes.size10,
                  Row(
                    children: [
                      const Text(
                        "Email : ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: AppColors.black,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          _email,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: AppColors.smsResendBlue,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  AppSizes.size10,
                  Row(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Date Of Birth : ",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Text(
                        _dob,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: AppColors.smsResendBlue,
                        ),
                      )
                    ],
                  ),
                  AppSizes.size10,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.editColor,
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
                        "Edit",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  AppSizes.size10,
                  const SizedBox(
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  AppSizes.size10,
                  const Text(
                    "Personal Data",
                    style: TextStyle(
                      color: AppColors.topicGreen,
                      fontSize: 25.0,
                    ),
                  ),
                  // if the personal data has been provided then the
                  AppSizes.size10,
                  const PersonalDataNotExist(),
                  AppSizes.size15,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.editColor,
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
                        "/paccreatingscreen",
                      );
                    },
                    child: const Text(
                      "Create PAC",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  AppSizes.size20,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.errorRed,
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
                      //   "/pacscreen",
                      // );
                    },
                    child: const Text(
                      "Unsubscribe",
                      style: TextStyle(
                        color: Colors.white,
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

class PersonalDataNotExist extends StatelessWidget {
  const PersonalDataNotExist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Personal data for model building  has not been provided !",
      style: TextStyle(
        color: AppColors.topicGreen,
        fontSize: 15.0,
      ),
    );
  }
}

class PersonalDataExist extends StatefulWidget {
  const PersonalDataExist({super.key});

  @override
  State<PersonalDataExist> createState() => _PersonalDataExistState();
}

class _PersonalDataExistState extends State<PersonalDataExist> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
