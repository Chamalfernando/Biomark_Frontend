class Pac {
  final String? id;
  final String? uniqueId;
  final String? dateOfBirth;
  final String? timeOfBirth;
  final String? location;
  final String? bloodGroup;
  final String? sex;
  final String? heightInMeters;
  final String? ethnicity;
  final String? eyeColor;

  Pac({
    required this.id,
    required this.uniqueId,
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
      id: json['_id'] as String?,
      uniqueId: json['uniqueId'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      timeOfBirth: json['timeOfBirth'] as String?,
      location: json['location'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      sex: json['sex'] as String?,
      heightInMeters: json['heightInMeters'] as String?,
      ethnicity: json['ethnicity'] as String?,
      eyeColor: json['eyeColor'] as String?,
    );
  }
}
