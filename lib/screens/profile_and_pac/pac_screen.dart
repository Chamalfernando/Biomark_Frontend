import 'package:biomark/models/pac.dart';
import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/screens/profile_and_pac/profile_screen.dart';
import 'package:biomark/services/backend_service.dart';
import 'package:biomark/widgets/Topic.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart'; // If formatting the date or time is necessary

class PACScreen extends StatefulWidget {
  const PACScreen({
    super.key,
  });

  @override
  State<PACScreen> createState() => _PACScreenState();
}

class _PACScreenState extends State<PACScreen> {
  late Future<Pac?> pacData;

  @override
  void initState() {
    super.initState();
    pacData =
        getPacDataById(); // Fetch PAC data by user ID when the screen loads
    customLogger.i("navigate to the PAC screen");
  }

  void _showPerksToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Perks will be available soon after the predictive model building 1st phase completed!"),
      ),
    );
  }

  void _showSubscribeToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Subscription is not available at the moment."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAC - Personal Archive Contribution'),
        backgroundColor: primaryGreen,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: whiteColor,
      body: FutureBuilder<Pac?>(
        future: pacData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            customLogger.i("Snapshot is waiting");
            return const Center(
              child: CircularProgressIndicator(),
            ); // Loading indicator
          } else if (snapshot.hasError) {
            customLogger.i("Snapshot have an error else if block");
            return Center(
              child: const Text(
                'Error loading PAC data',
              ),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            customLogger.i("else if block - Snapshot  have the data");
            final pac = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    boxSIZED_10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Avatar and thank you message
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
                              Icons.logout_rounded, // Logout icon
                              color: whiteColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/profileImg.png'),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Thank You for Your Contribution!",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: primaryGreen,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "We are truly grateful for your participation as a volunteer. "
                                "Exciting benefits will come your way as the models are built. "
                                "Stay tuned for more updates!",
                                style: TextStyle(
                                    fontSize: 16, color: smsResendBlue),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    boxSIZED_40,

                    // PAC Details Section
                    const CommonTopic(topic: "Your PAC Details"),
                    const SizedBox(height: 20),

                    _buildInfoTile('Unique ID', pac.uniqueId),
                    _buildInfoTile('Date of Birth', pac.dateOfBirth),
                    _buildInfoTile('Time of Birth', pac.timeOfBirth),
                    _buildInfoTile('Location', pac.location),
                    _buildInfoTile('Blood Group', pac.bloodGroup),
                    _buildInfoTile('Sex', pac.sex),
                    _buildInfoTile('Height (in meters)', pac.heightInMeters),
                    _buildInfoTile('Ethnicity', pac.ethnicity),
                    _buildInfoTile('Eye Color', pac.eyeColor),

                    boxSIZED_40,

                    // Closing message
                    Text(
                      "Your contribution to our project helps build predictive models that will "
                      "benefit many. Stay connected as more exciting features and benefits "
                      "become available soon!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // Perks and Subscribe Buttons
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Perks Button
                        ElevatedButton(
                          onPressed: _showPerksToast,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green, // Set background color to green
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Perks",
                            style: TextStyle(color: whiteColor),
                          ),
                        ),
                        // Subscribe Button
                        ElevatedButton(
                          onPressed: _showSubscribeToast,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red, // Set background color to red
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Subscribe",
                            style: TextStyle(color: whiteColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            customLogger.i("Snapshot Does not have the data else block");
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
          }
        },
      ),
    );
  }
}

// Helper widget for displaying PAC data in a formatted way
Widget _buildInfoTile(
  String label,
  String? value,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      tileColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: primaryGreen),
      ),
      subtitle: Text(
        value ?? 'Not available',
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    ),
  );
}
