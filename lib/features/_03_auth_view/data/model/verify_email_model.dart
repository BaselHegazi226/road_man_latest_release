class VerificationEmailModel {
  final String email;
  final String otp;
  VerificationEmailModel({required this.email, required this.otp});
  factory VerificationEmailModel.fromJson(Map<String, dynamic> json) {
    return VerificationEmailModel(email: json['email'], otp: json['otp']);
  }
  Map<String, dynamic> toJson() {
    return {'email': email, 'otp': otp};
  }
}
