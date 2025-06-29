import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:road_man_project/core/error/failure.dart';

abstract class ProfileRepos {
  Future<Either<Failure, Map<String, dynamic>>> updateProfile({
    required String name,
    required File photo,
    required DateTime dateOfBirth,
  });
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, Map<String, dynamic>>> getUserInfo({
    required String userToken,
  });
  Future<Either<Failure, void>> logOut();
}
