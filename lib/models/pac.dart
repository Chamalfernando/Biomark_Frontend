class Pac {
  final String id;
  final String dateOfBirth;
  final String timeOfBirth;
  final String location;
  final String bloodGroup;
  final String sex;
  final String heightInMeters;
  final String ethnicity;
  final String eyeColor;

  Pac({
    required this.id,
    required this.dateOfBirth,
    required this.timeOfBirth,
    required this.location,
    required this.bloodGroup,
    required this.sex,
    required this.heightInMeters,
    required this.ethnicity,
    required this.eyeColor,
  });

  factory Pac.fromJson(Map<String, dynamic> json) {
    return Pac(
      id: json['_id'],
      dateOfBirth: json['dateOfBirt'],
      timeOfBirth: json['timeOfBirth'],
      location: json['location'],
      bloodGroup: json['bloodGroup'],
      sex: json['sex'],
      heightInMeters: json['heightInMeters'],
      ethnicity: json['ethnicity'],
      eyeColor: json['eyeColor'],
    );
  }
}
