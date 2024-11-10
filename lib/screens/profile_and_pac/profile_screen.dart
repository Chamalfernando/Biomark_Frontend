import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/screens/profile_and_pac/popup_form.dart';
import 'package:biomark/services/encyption_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NormalProfileScreen extends StatefulWidget {
  const NormalProfileScreen({
    super.key,
  });

  @override
  State<NormalProfileScreen> createState() => _NormalProfileScreenState();
}

class _NormalProfileScreenState extends State<NormalProfileScreen> {
  @override
  void initState() {
    super.initState();
    _fetchUserData();
    customLogger.i("navigate to the profile screen");
  }

  User? _currentUser;
  bool _isLoading = true;

  // these will be gained by the backend logic.
  String _fullName = "";
  String _email = "";
  String _dob = "";
  String _userRole = "";
  String _passWord = "";
  // String _decryptedPassWord = "";

  // Method to fetch authenticated user's data from Firestore
  Future<void> _fetchUserData() async {
    try {
      // Get the currently authenticated user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        setState(() {
          _currentUser = user;
        });

        // Get the user's document from Firestore using their UID
        DocumentSnapshot<Map<String, dynamic>> userData =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .get();

        if (userData.exists) {
          // If user data is found, store it
          setState(() {
            _fullName = userData.data()?['fullName'] ?? 'No Name';
            _email = userData.data()?['email'] ?? 'No Email';
            _dob = userData.data()?['dob'] ?? 'No Date of Birth';
            _passWord = userData.data()?['passWord'] ?? 'No passWord provided';
            _userRole = userData.data()?['role'] ?? 'No user Role provided';
            _isLoading = false;
            // _passWord = EncryptionService.decrypt(_passWord);
            customLogger.i("userData fetched");
          });
        } else {
          // Handle the case where user data is missing
          setState(() {
            _isLoading = false;
            customLogger.e("user Data not found");
          });
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User data not found.'),
            ),
          );
        }
      }
    } catch (e) {
      // Handle any errors
      customLogger.e("Error occured when fetching the data");
      setState(() {
        _isLoading = false;
        _fullName = "Error fetching data";
        _email = "Error";
        _dob = "Error";
        _passWord = "Error";
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    }
  }

  // Update user data in Firestore
  // Future<void> _updateUserData(
  //     String firstName, String lastName, String email, String passWord) async {
  //   User? currentUser = FirebaseAuth.instance.currentUser;
  //   try {
  //     if (currentUser != null) {
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(currentUser.uid)
  //           .update({
  //         'firstName': firstName,
  //         'lastName': lastName,
  //         'email': email,
  //         'passWord': passWord,
  //       });

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('User data successfully updated!')),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to update user data: $e')),
  //     );
  //   }
  // }

  // Delete the user from Firestore and FirebaseAuth
  Future<void> _deleteUser() async {
    User? curntUser = FirebaseAuth.instance.currentUser;
    try {
      if (curntUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(curntUser.uid)
            .delete();

        await curntUser!.delete();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User successfully deleted!')),
        );

        Navigator.pushReplacementNamed(context, "/login");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete user: $e')),
      );
    }
  }

  // Log out the user
  Future<void> _logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Successfully logged out!',
          ),
        ),
      );
      Navigator.pop(
        // ignore: use_build_context_synchronously
        context,
      );
      customLogger.i("successfully logged out!");
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to log out: $e',
          ),
        ),
      );
    }
  }

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
                    // logout mechanism to be implemented.
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: logoutColor,
                        padding: const EdgeInsets.all(15),
                        shape:
                            const CircleBorder(), // Makes the button circular
                      ),
                      onPressed: () {
                        _logoutUser();
                        // Navigator.pushNamed(
                        //   context,
                        //   "/login",
                        // );
                      },
                      child: const Icon(
                        Icons.logout, // Logout icon
                        color: whiteColor,
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
                            'Hi There',
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
                              "$_fullName !",
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
                                text: "Full Name: ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: black,
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
                  Row(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "User Role : ",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: black,
                          ),
                        ),
                      ),
                      Text(
                        _userRole,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: smsResendBlue,
                        ),
                      )
                    ],
                  ),
                  boxSIZED_10,
                  Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "PassWord : ", // First part of the text
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: black, // Color for the first part
                                ),
                              ),
                              TextSpan(
                                text: _passWord,
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditDetailsPopup(
                              fullName: _fullName,
                              email: _email,
                              dob: _dob,
                              userRole: _userRole,
                              password: _passWord,
                            );
                          },
                        );
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
