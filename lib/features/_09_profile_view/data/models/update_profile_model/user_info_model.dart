import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/parse_date.dart';

import '../../../../../generated/assets.dart';

class UserInfoModel {
  final String? name, email, photo, photoBase64;
  final DateTime? dateOfBirth;
  final int? userID;

  UserInfoModel({
    required this.userID,
    required this.email,
    required this.photo,
    required this.photoBase64,
    required this.name,
    required this.dateOfBirth,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    final String? rawBase64 = json['photoBase64'];
    final String? rawPhoto = json['photo']?.toString();

    final allowedExtensions = ['.png', '.jpg', '.jpeg', '.svg'];
    final hasAllowedExtension =
        rawPhoto != null &&
        allowedExtensions.any((ext) => rawPhoto.toLowerCase().endsWith(ext));

    return UserInfoModel(
      userID: json['userID'] ?? 0,
      email: json['email'] ?? 'user@gmail.com',
      name: json['name'] ?? '',
      dateOfBirth: Date.parseDate(json['dateOfBirth']),
      photoBase64: rawBase64,
      photo:
          rawBase64 != null && rawBase64.isNotEmpty
              ? ''
              : (hasAllowedExtension
                  ? rawPhoto
                  : Assets.profileProfileUserImage),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'email': email,
      'name': name,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'photoBase64': photoBase64,
    };
  }

  UserInfoModel copyWith({
    int? userID,
    String? email,
    String? photo,
    String? name,
    DateTime? dateOfBirth,
    String? photoBase64,
  }) {
    return UserInfoModel(
      userID: userID ?? this.userID,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      photoBase64: photoBase64 ?? this.photoBase64,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
