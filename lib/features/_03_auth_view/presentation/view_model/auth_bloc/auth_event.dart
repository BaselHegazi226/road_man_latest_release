// auth_event.dart
abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class ForgetPasswordEvent extends AuthEvent {
  final String email;

  ForgetPasswordEvent({required this.email});
}

class VerifyOtpEvent extends AuthEvent {
  final String email, otp;
  VerifyOtpEvent({required this.email, required this.otp});
}

class VerifyEmailEvent extends AuthEvent {
  final String email, otp;
  VerifyEmailEvent({required this.email, required this.otp});
}

class SendAgainVerifyEmailEvent extends AuthEvent {
  final String email, otp;
  SendAgainVerifyEmailEvent({required this.email, required this.otp});
}

class ResetPasswordEvent extends AuthEvent {
  final String email, otp, newPassword, confirmPassword;
  ResetPasswordEvent({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });
}

class RefreshTokenEvent extends AuthEvent {
  final String accessToken;
  final String refreshToken;

  RefreshTokenEvent({required this.accessToken, required this.refreshToken});
}
