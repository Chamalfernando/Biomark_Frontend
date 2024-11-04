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

String? validateUsername(String? value) {
  // Basic null/empty check
  if (value == null || value.isEmpty) {
    return 'Please enter your username';
  }

  // Ensure username has at least 8 characters
  if (value.length < 8) {
    return 'Username must be at least 8 characters long';
  }

  // Ensure first character is not a number
  if (RegExp(r'^[0-9]').hasMatch(value)) {
    return 'Username cannot start with a number';
  }

  return null; // If username is valid
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
