import 'dart:io';

abstract class ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final DateTime dateOfBirth;
  final File? photoFile;

  UpdateProfileEvent({
    required this.name,
    required this.dateOfBirth,
    this.photoFile,
  });
}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword, newPassword, confirmPassword;
  ChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}

class LogOutEvent extends ProfileEvent {}
