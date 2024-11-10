import 'package:biomark/models/pac.dart';
import 'package:biomark/resources/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://localhost:3000/api'; // Your backend URL

Future<Pac?> getPacDataById() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getString("userUniqueId");

  // final id = getUserUniqueId();

  final url = "$baseUrl/pac/$id"; // The endpoint you defined in the backend

  customLogger.i("userUniqueId = $id");
  print(url);
  customLogger.i("Url is $url");

  try {
    customLogger.i("inside the try before get");
    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    customLogger.i("Status Code is ${response.statusCode}");
    //
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      customLogger.i("User Data fetched ${jsonData.toString()}");
      // Ensure the returned JSON data is not null
      if (jsonData != null && jsonData.isNotEmpty) {
        return Pac.fromJson(jsonData);
      } else {
        customLogger.e('Empty PAC data received');
        return null;
      }
    } else if (response.statusCode == 304) {
      final jsonData = jsonDecode(response.body);
      customLogger.e('User Data has not been changed: ${response.statusCode}');
      return Pac.fromJson(jsonData);
    } else {
      customLogger.e('Failed to load PAC data: ${response.statusCode}');
      return null; // Return null to indicate failure
    }
  } catch (error) {
    customLogger.e('Error: $error');
    return null;
  }
}

Future<String?> getUserUniqueId() async {
  final prefs = await SharedPreferences.getInstance();
  customLogger.i(prefs.getString('userUniqueId'));
  return prefs.getString('userUniqueId');
}

Future<void> loadUserData() async {
  final userId = await getUserUniqueId();
  customLogger.i("User ID void: $userId");
}

// Future<String?> removeUserUniqueId() async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.remove('userUniqueId');
//   return "user unique id removed";
// }

Future<String?> getUserRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('ROLE_1'); // Fetch the user role
}

Future<bool?> isUserVolunteer() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('ROLE_2'); // Fetch if the user is a volunteer
}

// Example usage:
void checkUserRole() async {
  String? role = await getUserRole();
  bool? isVol = await isUserVolunteer();
  if (role != null && role == 'GENERALUSER') {
    customLogger.i("User is a GENERALUSER");
    // Perform role-specific actions
  } else if (isVol == true && role == "VOLUNTEER") {
    customLogger.i("User is a VOLUNTEER");
  } else {
    customLogger.i("User role not found");
  }
}

// function to change the userRole to Volunteer
Future<void> changeUserRoleStatus() async {
  String? isGeneral = getUserRole() as String?;
  if (isGeneral == "GENERALUSER") {}
}

// Example usage:
void checkUserVolunteer() async {
  bool? isVolntr = await isUserVolunteer();
  if (isVolntr == true) {
    customLogger.i("User is a VOLUNTEER");
    // Perform role-specific actions
  } else {
    customLogger.i("User is not a VOLUNTEER");
  }
}
