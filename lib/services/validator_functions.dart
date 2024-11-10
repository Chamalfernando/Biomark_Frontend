import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for bcrypt

String? validateEmail(String? value) {
  // Basic null/empty check
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }

  // Regular expression to validate email
  String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(emailPattern);

  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }

  return null; // If email is valid
}

String? validatePassword(String? value) {
  // Basic null/empty check
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }

  // Ensure the length is between 8 and 12 characters
  if (value.length < 8 || value.length > 12) {
    return 'Password must be between 8 and 12 characters long';
  }

  // Ensure password does not start with a number
  if (RegExp(r'^[0-9]').hasMatch(value)) {
    return 'Password cannot start with a numeric character';
  }

  // Ensure at least one uppercase letter
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }

  // Ensure at least one symbolic character (special character)
  if (!RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(value)) {
    return 'Password must contain at least one symbolic character';
  }

  // Ensure at least one numeric character
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one numeric character';
  }

  return null; // If password meets all criteria
}

String? validateFirstName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your first name';
  }

  // Check if the first name contains any spaces
  if (value.contains(' ')) {
    return 'First name should not contain spaces';
  }

  return null; // Return null if valid
}

String? validateLastName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your last name';
  }

  // Check if the last name contains any spaces
  if (value.contains(' ')) {
    return 'Last name should not contain spaces';
  }

  return null; // Return null if valid
}

// String? validateFullName(String? value, String firstName, String lastName) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter your full name';
//   }

//   // Ensure the full name contains both the first and last names as words
//   if (!value.toLowerCase().contains(firstName.toLowerCase()) ||
//       !value.toLowerCase().contains(lastName.toLowerCase())) {
//     return 'Full name must include both first and last names';
//   }

//   return null; // Return null if valid
// }

String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  }

  // Regular expression to ensure full name contains only letters and spaces between words
  RegExp nameRegExp = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$');

  if (!nameRegExp.hasMatch(value)) {
    return 'Full name can only contain letters and spaces';
  }

  return null; // Return null if valid
}

String? validateDOB(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your date of birth';
  }

  // Regular expression to match the format dd/MM/yyyy
  final RegExp dateRegExp =
      RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$');

  if (!dateRegExp.hasMatch(value)) {
    return 'Please enter a valid date (dd/MM/yyyy)';
  }

  return null; // Return null if valid
}

// // Hash the password using bcrypt
// String hashPassword(String password) {
//   String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
//   return hashedPassword;
// }

// // Verify the password when a user logs in
// bool verifyPassword(String password, String hashedPassword) {
//   return BCrypt.checkpw(password, hashedPassword);
// }

String? validateTimeOfBirth(String? value) {
  if (value == null || value.isEmpty) {
    return 'Time of birth cannot be null';
  }
  return null; // Return null if valid
}

// Function to validate TimeOfBirth with selectedTime as TimeOfDay
// String? validateTimeOfBirth(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please select the time of birth.';
//   }

//   // Parse the value from string to TimeOfDay (assuming the format is like '2:49 PM')
//   final parsedTime = _parseTime(value);
//   if (parsedTime == null) {
//     return 'Invalid time format.';
//   }

//   final now = TimeOfDay.now();
//   if (parsedTime.hour > now.hour ||
//       (parsedTime.hour == now.hour && parsedTime.minute > now.minute)) {
//     return 'Time of birth cannot be in the future.';
//   }
//   return null; // Return null if valid
// }

// Function to parse String to TimeOfDay (use 24-hour format if needed)
// TimeOfDay? _parseTime(String value) {
//   try {
//     final format = DateFormat.jm(); // e.g., 2:49 PM
//     final dateTime = format.parse(value);
//     return TimeOfDay.fromDateTime(dateTime);
//   } catch (e) {
//     return null;
//   }
// }

String? validateLocation(String location) {
  if (location.isEmpty) {
    return 'Location cannot be empty';
  } else if (location.length < 3) {
    return 'Location name is too short';
  }
  return null; // Return null if valid
}
