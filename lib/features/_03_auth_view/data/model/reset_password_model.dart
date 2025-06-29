class ResetPasswordModel {
  final String email, otp, newPassword, confirmPassword;

  ResetPasswordModel({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });
  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      email: json['email'],
      otp: json['otp'],
      newPassword: json['newPassword'],
      confirmPassword: json['confirmPassword'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }
}
