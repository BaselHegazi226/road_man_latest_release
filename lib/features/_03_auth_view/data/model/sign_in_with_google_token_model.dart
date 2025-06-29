class SignInWithGoogleTokenModel {
  final String token;
  SignInWithGoogleTokenModel({required this.token});
  factory SignInWithGoogleTokenModel.fromJson(Map<String, dynamic> json) {
    return SignInWithGoogleTokenModel(token: json['token']);
  }
  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
