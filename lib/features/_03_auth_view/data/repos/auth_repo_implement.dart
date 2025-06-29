import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_03_auth_view/data/model/forget_password_model.dart';
import 'package:road_man_project/features/_03_auth_view/data/model/sign_in_model.dart';
import 'package:road_man_project/features/_03_auth_view/data/model/sign_in_with_google_token_model.dart';
import 'package:road_man_project/features/_03_auth_view/data/model/user_token_model.dart';
import 'package:road_man_project/features/_03_auth_view/data/model/verification_otp_model.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo.dart';

import '../../../../core/manager/tokens_manager.dart';
import '../model/refresh_token_model.dart';
import '../model/reset_password_model.dart';
import '../model/sign_up_model.dart';
import '../model/verify_email_model.dart';

class AuthRepoImplement implements AuthRepo {
  final Dio dio = Dio();
  final String baseUrl = 'http://met2025-001-site1.anytempurl.com/api';

  @override
  Future<Either<Failure, void>> sendAgainVerificationEmail({
    required String email,
    required String otp,
  }) async {
    final String sendAgainVerifyEmail = '$baseUrl/Accounts/verify-email';
    final sendAgainVerificationEmailModel = VerificationEmailModel(
      email: email,
      otp: otp,
    );
    try {
      final response = await dio.post(
        sendAgainVerifyEmail,
        data: sendAgainVerificationEmailModel.toJson(),
      );
      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
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
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final signUpPath = '$baseUrl/Accounts/register';
    final signUpModel = SignUpModel(
      name: name,
      email: email,
      password: password,
    );
    try {
      final response = await dio.post(signUpPath, data: signUpModel.toJson());
      if (response.statusCode == 200) {
        return right(null);
      } else {
        print(
          'error from ${ServerFailure.fromResponse(statusCode: response.statusCode, responseData: response.data)}',
        );
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      print('dio error : ${ServerFailure.fromDioException(dioException)}');
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      print('unknown error : ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserTokensModel>> signIn({
    required String email,
    required String password,
  }) async {
    final signInPath = '$baseUrl/Accounts/login';
    final signInModel = SignInModel(email: email, password: password);
    try {
      final response = await dio.post(signInPath, data: signInModel.toJson());
      if (response.statusCode == 200) {
        final data =
            response.data is String ? jsonDecode(response.data) : response.data;
        final UserTokensModel userTokenModel = UserTokensModel.fromJson(data);
        await SecureStorageHelper.saveUserTokens(userTokenModel);
        return right(userTokenModel);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
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
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    final forgetPasswordPath = '$baseUrl/Accounts/forgot-password';
    final forgetPasswordModel = ForgetPasswordModel(email: email);
    try {
      final response = await dio.post(
        forgetPasswordPath,
        data: forgetPasswordModel.toJson(),
      );
      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
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
  Future<Either<Failure, void>> verificationOtp({
    required String email,
    required String otp,
  }) async {
    final String verifyOtp = '$baseUrl/Accounts/verify-otp';
    final verificationAfterForgetPasswordModel = VerificationCodeModel(
      email: email,
      otp: otp,
    );
    try {
      final response = await dio.post(
        verifyOtp,
        data: verificationAfterForgetPasswordModel.toJson(),
      );
      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
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
  Future<Either<Failure, UserTokensModel>> verificationEmail({
    required String email,
    required String otp,
  }) async {
    final String verifyEmail = '$baseUrl/Accounts/verify-email';
    final verificationEmailModel = VerificationEmailModel(
      email: email,
      otp: otp,
    );
    try {
      final response = await dio.post(
        verifyEmail,
        data: verificationEmailModel.toJson(),
      );
      if (response.statusCode == 200) {
        print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
        final data =
            response.data is String ? jsonDecode(response.data) : response.data;
        print('data : $data');
        final UserTokensModel userTokenModel = UserTokensModel.fromJson(data);
        print('token:${userTokenModel.token}');
        await SecureStorageHelper.saveUserTokens(userTokenModel);

        print('Status Code: ${response.statusCode}');
        print('Response Data: ${response.data}');
        print('Response headers: ${response.headers}');

        return right(userTokenModel);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
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
  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final idToken = await userCredential.user?.getIdToken();
      print('token with google from implement = $idToken');
      if (idToken == null) {
        return left(FirebaseFailure(errorMessage: 'Unable to find user info'));
      }
      return right(idToken);
    } on FirebaseAuthException catch (authException) {
      print('aut exceppppppption ${authException.message}');
      return left(
        FirebaseFailure.fromFirebaseAuthException(exception: authException),
      );
    } on FirebaseException catch (exception) {
      print('excptionnnnnnnnnnnnnnnnnn ${exception.message}');
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } catch (e) {
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrr ${e.toString()}');
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserTokensModel>> signInWithGoogleToken({
    required String token,
  }) async {
    final String signInWithGoogleTokenPath = '$baseUrl/Accounts/google-login';
    final signInWithGoogleTokenModel = SignInWithGoogleTokenModel(token: token);
    try {
      final response = await dio.post(
        signInWithGoogleTokenPath,
        data: signInWithGoogleTokenModel.toJson(),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        print('data = $data');
        final UserTokensModel userTokenModel = UserTokensModel.fromJson(data);
        await SecureStorageHelper.saveUserTokens(userTokenModel);
        return right(userTokenModel);
      } else {
        print(
          'error from hazem google with status code : ${ServerFailure.fromResponse(statusCode: response.statusCode, responseData: response.data)}',
        );
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      print('error from hazem google : ${dioException.message}');
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      print('error : ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String otp,
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final String resetPasswordPath = '$baseUrl/Accounts/reset-password';
    final resetPasswordPathModel = ResetPasswordModel(
      email: email,
      otp: otp,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    try {
      final response = await dio.post(
        resetPasswordPath,
        data: resetPasswordPathModel.toJson(),
      );
      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
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
  Future<Either<Failure, UserTokensModel>> refreshToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    final refreshTokenPath = '$baseUrl/Accounts/refresh-token';

    final userTokens = await SecureStorageHelper.getUserTokens();

    try {
      // التأكد من وجود التوكنات في ال SecureStorageHelper
      if (userTokens == null || userTokens.token.isEmpty) {
        return left(ServerFailure(errorMessage: 'Token not found.'));
      }

      // تحقق من صلاحية التوكن
      final expirationDate = await SecureStorageHelper.getUserTokenExpiration();
      if (DateTime.now().isAfter(expirationDate)) {
        // التوكن انتهت صلاحيتها، نحتاج لتحديثها
        final refreshTokenModel = RefreshTokenModel(
          accessToken: userTokens.token,
          refreshToken: userTokens.refreshToken,
        );

        // إرسال طلب التحديث للسيرفر
        final response = await dio.post(
          refreshTokenPath,
          data: refreshTokenModel.toJson(),
        );

        // التعامل مع الاستجابة
        if (response.statusCode == 200) {
          // استخراج التوكنات الجديدة من الاستجابة
          final newTokenModel = UserTokensModel.fromJson(response.data);

          // تخزين التوكنات الجديدة في SecureStorageHelper
          await SecureStorageHelper.saveUserTokens(newTokenModel);

          // إرجاع التوكنات الجديدة
          return right(newTokenModel);
        } else {
          return left(
            ServerFailure.fromResponse(
              statusCode: response.statusCode,
              responseData: response.data,
            ),
          );
        }
      } else {
        return right(userTokens); // التوكن ما زالت صالحة
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
