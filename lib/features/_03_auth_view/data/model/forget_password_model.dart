class ForgetPasswordModel {
  final String email;
  ForgetPasswordModel({required this.email});
  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(email: json['email'] as String);
  }
  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
