import 'package:biomark/models/pac.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> getUserUniqueId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userUniqueId');
}

Future<String?> removeUserUniqueId() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('userUniqueId');
  return "user unique id removed";
}

Future<void> fetchPacData() async {
  final userId = await getUserUniqueId();
  if (userId != null) {
    final response = await http.get(
      Uri.parse('http://localhost:3000/pac/$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Handle the retrieved PAC data

      // final pacData = jsonDecode(response.body);

      // Do something with pacData
    } else {
      // Handle error
    }
  } else {
    print("no PAC data for the user.");
  }
}

Future<String?> getUserRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('ROLE_1'); // Fetch the user role
}

// Example usage:
void checkUserRole() async {
  String? role = await getUserRole();
  if (role != null && role == 'GENERALUSER') {
    print('User is a GENERALUSER');
    // Perform role-specific actions
  } else {
    print('User role not found');
  }
}

Future<bool?> isUserVolunteer() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('ROLE_2'); // Fetch if the user is a volunteer
}

// Example usage:
void checkUserVolunteer() async {
  bool? isVolntr = await isUserVolunteer();
  if (isVolntr == true) {
    print('User is a VOLUNTEER');
    // Perform role-specific actions
  } else {
    print('User is not a VOLUNTEER');
  }
}

class PacService {
  static const String baseUrl = 'http://localhost:3000'; // Your backend URL

  Future<Pac?> getPacById() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString("userUniqueId");

    final url = '$baseUrl/pac/$id'; // The endpoint you defined in the backend

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Pac.fromJson(jsonData);
      } else {
        print('Failed to load PAC data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
    return null;
  }
}