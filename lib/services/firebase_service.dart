import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserDetails(Map<String, dynamic> data) async {
    try {
      await _db.collection("user_data").add(data);
    } catch (e) {
      print("Error saving user data to Firebase: $e");
    }
  }
}
