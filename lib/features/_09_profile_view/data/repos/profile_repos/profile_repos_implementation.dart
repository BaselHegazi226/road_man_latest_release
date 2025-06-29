import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/change_password_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/update_profile_get_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos.dart';

import '../../../../../core/manager/tokens_manager.dart';

class ProfileReposImplementation extends ProfileRepos {
  final Dio dio = Dio();
  final String baseUrl = 'http://met2025-001-site1.anytempurl.com/api';

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateProfile({
    required String name,
    required File photo,
    required DateTime dateOfBirth,
  }) async {
    final String updateProfilePath = '$baseUrl/Accounts/update-profile';

    final userTokens = await SecureStorageHelper.getUserTokens();
    final String? userToken = userTokens?.token;

    try {
      final bool hasPhoto = photo.path.trim().isNotEmpty && photo.existsSync();
      String extension = photo.path.split('.').last.toLowerCase();
      String mimeType =
          (extension == 'jpg' || extension == 'jpeg') ? 'jpeg' : extension;

      final FormData dataToSend = FormData.fromMap({
        'Name': name,
        'DateOfBirth': dateOfBirth.toUtc().toIso8601String(),
        if (hasPhoto)
          'photo': await MultipartFile.fromFile(
            photo.path,
            filename: photo.path.split('/').last,
            contentType: MediaType('image', mimeType),
          ),
      });
      print('🧾 Form fields:');
      dataToSend.fields.forEach(
        (field) => print('${field.key} = ${field.value}'),
      );
      print('🧾 Form files:');
      dataToSend.files.forEach(
        (file) => print('${file.key} = ${file.value.filename}'),
      );
      print('✅ Content-Type sent = image/png');
      print('✅ File exists: ${photo.existsSync()}');
      print('✅ File size = ${await photo.length()} bytes');

      print('📸 Sending image: ${photo.path}');
      print('📅 Date of birth: ${dateOfBirth.toUtc().toIso8601String()}');

      final response = await dio.put(
        updateProfilePath,
        data: dataToSend,
        options: Options(
          headers: {
            'Authorization': 'Bearer $userToken',
            // مايحتاجش تضيف content-type هنا، Dio هيضبطه تلقائي
          },
        ),
      );
      print('response.data = ${response.data}');

      if (response.statusCode == 200) {
        print('bodyyyyyyyyyyyyy : ${response.data}');
        final model = UpdateProfileGetModel.fromJson(response.data);
        return right(model.toJson());
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode!,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      print('dio exception : ${dioException.message}');
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      print('error : ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final userTokens = await SecureStorageHelper.getUserTokens();
    String? userToken = userTokens?.token;

    final String changePasswordPath = '$baseUrl/Accounts/change-password';
    final changePasswordModel = ChangePasswordModel(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    try {
      final response = await dio.post(
        changePasswordPath,
        data: changePasswordModel.toJson(),
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );

      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode!,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserInfo({
    required String userToken,
  }) async {
    final String userInfoPath = '$baseUrl/Accounts/get-user-info';

    try {
      print('🔑 Token used in getUserInfo: $userToken');
      final response = await dio.get(
        userInfoPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );

      print('📡 Status Code: ${response.statusCode}');
      print('📥 Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final userInfoModel = UserInfoModel.fromJson(response.data);

        print('✅ User Info Parsed Successfully:');
        print('🧍 Name: ${userInfoModel.name}');
        print('📧 Email: ${userInfoModel.email}');
        print('🖼️ Photo URL: ${userInfoModel.photo}');
        print('🖼️ Photo Base64: ${userInfoModel.photoBase64}');
        print('🎂 Date of Birth: ${userInfoModel.dateOfBirth}');

        return right(userInfoModel.toJson());
      } else {
        print('❌ Error: Unexpected status code');
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode!,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      print('❌ DioException: ${dioException.message}');
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      print('❌ Unexpected Error: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    final String signOutPath = '$baseUrl/Accounts/sign-out';

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();

      if (userTokens == null || userTokens.token.isEmpty) {
        return left(ServerFailure(errorMessage: 'You are not signed in!'));
      }

      final response = await dio.post(
        signOutPath,
        options: Options(
          headers: {'Authorization': 'Bearer ${userTokens.token}'},
        ),
      );

      if (response.statusCode == 200) {
        await SecureStorageHelper.clearTokens();
        return right(null);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode!,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
