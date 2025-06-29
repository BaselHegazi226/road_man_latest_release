import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/parse_date.dart';

class UpdateProfileGetModel {
  final String name;
  final String? photUrl;
  final String base64;
  final DateTime? dateOfBirth;

  UpdateProfileGetModel({
    required this.name,
    required this.photUrl,
    required this.base64,
    required this.dateOfBirth,
  });

  factory UpdateProfileGetModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileGetModel(
      name: json['name'] ?? '',
      photUrl: json['photo'] ?? '', // أو استخدم photUrl لو فعلاً كده في الـ API
      base64: json['base64'] ?? '',
      dateOfBirth: Date.parseDate(json['dateOfBirth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photUrl,
      'base64': base64,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
    };
  }
}
