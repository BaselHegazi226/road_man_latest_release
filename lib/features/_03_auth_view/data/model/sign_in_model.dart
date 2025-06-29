class SignInModel {
  final String email, password;
  SignInModel({required this.email, required this.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
