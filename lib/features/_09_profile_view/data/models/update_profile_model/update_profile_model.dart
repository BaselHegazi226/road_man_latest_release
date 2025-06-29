import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/parse_date.dart';

class UpdateProfileModel {
  final String? name;
  final String? photo;
  final DateTime? dateOfBirth;

  UpdateProfileModel({
    required this.photo,
    required this.name,
    required this.dateOfBirth,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      photo: json['photo']?.toString(),
      name: json['name']?.toString(),
      dateOfBirth: Date.parseDate(json['dateOfBirth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
    };
  }
}
