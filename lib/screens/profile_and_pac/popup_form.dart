import 'package:biomark/resources/logger.dart';
import 'package:biomark/resources/theme.dart';
import 'package:biomark/services/validator_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class EditDetailsPopup extends StatefulWidget {
  final String fullName;
  final String email;
  final String dob;
  final String userRole;
  final String password;

  const EditDetailsPopup({
    super.key,
    required this.fullName,
    required this.email,
    required this.dob,
    required this.userRole,
    required this.password,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditDetailsPopupState createState() => _EditDetailsPopupState();
}

class _EditDetailsPopupState extends State<EditDetailsPopup> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _dobController;
  late TextEditingController _userRoleController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with the current values
    _fullNameController = TextEditingController(text: widget.fullName);
    _emailController = TextEditingController(text: widget.email);
    _dobController = TextEditingController(text: widget.dob);
    _userRoleController = TextEditingController(text: widget.userRole);
    _passwordController = TextEditingController(text: widget.password);
  }

  // Firestore update method
  Future<void> _updateUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Step 1: Update Firestore with other fields (like fullName, dob, userRole)
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'fullName': _fullNameController.text,
          'email': _emailController.text,
          'dob': _dobController.text,
          'userRole': _userRoleController.text,
          'passWord': _passwordController
              .text, // You can store encrypted passwords in Firestore
        });

        // Step 2: Check if email is updated and update in Firebase Auth
        // if (user.email != _emailController.text) {
        // ignore: deprecated_member_use
        // await user.updateEmail(_emailController.text);
        // }

        // Step 3: Check if password is updated and update in Firebase Auth
        // if (_passwordController.text.isNotEmpty) {
        //   await user.updatePassword(_passwordController.text);
        // }

        updateUserEmailAndPasswordInFirebase(
          _emailController.text,
          _passwordController.text,
        );

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'User data successfully updated!',
            ),
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to update user data: $e',
          ),
        ),
      );
    }
  }

  Future<void> updateUserEmailAndPasswordInFirebase(
      String newEmail, String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Update the email
        // ignore: deprecated_member_use
        await user.updateEmail(newEmail);
        customLogger.i('Email updated successfully.');

        // Update the password
        await user.updatePassword(newPassword);
        customLogger.i('Password updated successfully.');

        // After updating, you can force the user to reauthenticate to ensure changes take effect
        await FirebaseAuth.instance.currentUser?.reload();
        user = FirebaseAuth.instance.currentUser;

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'User email and password successfully updated!',
            ),
          ),
        );
      }
    } catch (e) {
      customLogger.e('Error: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to update email and password: $e',
          ),
        ),
      );
    }
  }

  Future<void> reauthenticateAndUpdate(
      String newEmail, String newPassword, String currentPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Re-authenticate the user
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );
        await user.reauthenticateWithCredential(credential);

        // Now update the email and password
        // ignore: deprecated_member_use
        await user.updateEmail(newEmail);
        await user.updatePassword(newPassword);

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'User email and password successfully updated!',
            ),
          ),
        );
      }
    } catch (e) {
      customLogger.e('Error: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to reauthenticate and update: $e',
          ),
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date as default
      firstDate: DateTime(1900), // Start date limit
      lastDate: DateTime.now(), // End date limit
    );

    if (pickedDate != null) {
      // Format the selected date
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      setState(
        () {
          _dobController.text =
              formattedDate; // Update the TextFormField with selected date
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Details',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            boxSIZED_20,
            _buildTextField(
              'Full Name',
              _fullNameController,
            ),
            _buildTextField(
              'Email',
              _emailController,
            ),
            // _buildTextField(
            //   'Date of Birth',
            //   _dobController,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                controller: _dobController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: "Date Of Birth",
                  fillColor: whiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(
                        context,
                      ); // Open the date picker when the icon is tapped
                    },
                  ),
                ),
                readOnly: true,
              ),
            ),
            _buildTextField(
              'User Role',
              _userRoleController,
            ),
            _buildTextField(
              'Password',
              _passwordController,
              obscureText: false,
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Submit the updated values
                  // Navigator.of(context).pop({
                  //   'fullName': _fullNameController.text,
                  //   'email': _emailController.text,
                  //   'dob': _dobController.text,
                  //   'userRole': _userRoleController.text,
                  //   'password': _passwordController.text,
                  // });
                  // Call method to update Firestore with the new values
                  _updateUserData();
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create text fields
  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
    // InputDecoration? decoration,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
