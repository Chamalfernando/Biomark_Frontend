import 'package:biomark/models/pac.dart';
import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/screens/profile_and_pac/profile_screen.dart';
import 'package:biomark/services/backend_service.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';

class PACScreen extends StatefulWidget {
  // final String userId; // Add userId parameter to get specific PAC data
  const PACScreen({
    super.key,
    // required this.userId,
  });

  @override
  State<PACScreen> createState() => _PACScreenState();
}

class _PACScreenState extends State<PACScreen> {
  late Future<Pac?> pacData;

  @override
  void initState() {
    super.initState();
    // Fetch PAC data by user ID when the screen loads
    pacData = getPacDataById();
    customLogger.i("navigate to the PAC screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAC'),
        backgroundColor: primaryGreen,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: whiteColor,
      body: FutureBuilder<Pac?>(
        future: pacData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Loading indicator
          } else if (snapshot.hasError) {
            return Center(
              child: const Text(
                'Error loading PAC data',
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'No PAC data found',
                  ),
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
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => NormalProfileScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text(
                      "Go to Profile",
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            final pac = snapshot.data;
            return SingleChildScrollView(
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
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => NormalProfileScreen(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: const Icon(
                              Icons.person_rounded, // Logout icon
                              color: whiteColor,
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: logoutColor,
                        //       padding: const EdgeInsets.symmetric(
                        //         horizontal: 40,
                        //         vertical: 15,
                        //       ),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //     onPressed: () {
                        //       // handle logout screen
                        //     },
                        //     child: const Text(
                        //       "Logout",
                        //       style: TextStyle(
                        //         color: whiteColor,
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                    CommonTopic(
                      topic: pac?.id ?? "PAC",
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
            );
          }
        },
      ),
    );
  }
}
