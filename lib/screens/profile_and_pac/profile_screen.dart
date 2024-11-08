import 'package:biomark/resources/theme.dart';
import 'package:flutter/material.dart';

class NormalProfileScreen extends StatefulWidget {
  final String userFullName;

  const NormalProfileScreen({
    super.key,
    required this.userFullName,
  });

  @override
  State<NormalProfileScreen> createState() => _NormalProfileScreenState();
}

class _NormalProfileScreenState extends State<NormalProfileScreen> {
  // these will be gained by the backend logic.
  String _fullName = "John Doe Johone lsajflsjoflknsv sidfluew";
  String _email = "johnDoe@hotmail.com";
  String _dob = "20/09/1970";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
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
                  backgroundImage: AssetImage(
                    'assets/profileImg.png',
                  ),
                ),
              ),
              boxSIZED_20,
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            // 'Hi There $_fullName',
                            'Hi There Chamal Jong doe',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: black,
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
                                color: topicGreen,
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
              boxSIZED_20,
              const SizedBox(
                child: Divider(
                  color: black,
                  thickness: 2,
                ),
              ),
              boxSIZED_15,
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
                                  color: black, // Color for the first part
                                ),
                              ),
                              TextSpan(
                                text: _fullName,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color:
                                      smsResendBlue, // Color for the second part
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  boxSIZED_10,
                  Row(
                    children: [
                      const Text(
                        "Email : ",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: black,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          _email,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: smsResendBlue,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  boxSIZED_10,
                  Row(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Date Of Birth : ",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: black,
                          ),
                        ),
                      ),
                      Text(
                        _dob,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: smsResendBlue,
                        ),
                      )
                    ],
                  ),
                  boxSIZED_10,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: editColor,
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
                          color: black,
                        ),
                      ),
                    ),
                  ),
                  boxSIZED_10,
                  const SizedBox(
                    child: Divider(
                      color: black,
                      thickness: 2,
                    ),
                  ),
                  boxSIZED_10,
                  const Text(
                    "Personal Data",
                    style: TextStyle(
                      color: topicGreen,
                      fontSize: 25.0,
                    ),
                  ),

                  /* if the personal data has been provided then the 
                    using ('userUniqueId') we can create a logic to visualize those data for this screen.

                    getUserUniqueId() will return the string related to that.
                  */

                  boxSIZED_10,
                  const PersonalDataNotExist(),
                  boxSIZED_15,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: editColor,
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
                        color: black,
                      ),
                    ),
                  ),
                  boxSIZED_20,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: errorRed,
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
                        color: whiteColor,
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
        color: topicGreen,
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
