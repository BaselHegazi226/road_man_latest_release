import 'package:dartz/dartz.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_03_auth_view/data/model/user_token_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserTokensModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> forgetPassword({required String email});
  Future<Either<Failure, void>> resetPassword({
    required String otp,
    required String email,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, void>> verificationOtp({
    required String email,
    required String otp,
  });
  Future<Either<Failure, UserTokensModel>> verificationEmail({
    required String email,
    required String otp,
  });
  Future<Either<Failure, void>> sendAgainVerificationEmail({
    required String email,
    required String otp,
  });
  Future<Either<Failure, String>> signInWithGoogle();
  Future<Either<Failure, UserTokensModel>> signInWithGoogleToken({
    required String token,
  });
  Future<Either<Failure, UserTokensModel>> refreshToken({
    required String accessToken,
    required String refreshToken,
  });
  Future<Either<Failure, T>> _executeWithRefreshToken<T>({
    required Future<Either<Failure, T>> Function() executeRequest,
    required String accessToken,
    required String refreshToken,
  });
}
