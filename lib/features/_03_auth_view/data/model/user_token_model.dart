class UserTokensModel {
  final String token, refreshToken;
  UserTokensModel({required this.token, required this.refreshToken});
  factory UserTokensModel.fromJson(Map<String, dynamic> json) {
    return UserTokensModel(
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"token": token, "refreshToken": refreshToken};
  }
}
