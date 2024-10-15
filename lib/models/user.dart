class User {
  final String fullName;
  final String dob;
  final String email;
  final String password;
  final String mothersMaidenName;
  final String childhoodFriend;
  final String petName;
  final String customQuestion;

  User({
    required this.fullName,
    required this.dob,
    required this.email,
    required this.password,
    required this.mothersMaidenName,
    required this.childhoodFriend,
    required this.petName,
    required this.customQuestion,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'dob': dob,
      'email': email,
      'password': password,
      'mothersMaidenName': mothersMaidenName,
      'childhoodFriend': childhoodFriend,
      'petName': petName,
      'customQuestion': customQuestion,
    };
  }
}
