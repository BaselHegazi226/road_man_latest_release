class VerificationCodeModel {
  final String email;
  final String otp;
  VerificationCodeModel({required this.email, required this.otp});
  factory VerificationCodeModel.fromJson(Map<String, dynamic> json) {
    return VerificationCodeModel(email: json['email'], otp: json['otp']);
  }
  Map<String, dynamic> toJson() {
    return {'email': email, 'otp': otp};
  }
}
