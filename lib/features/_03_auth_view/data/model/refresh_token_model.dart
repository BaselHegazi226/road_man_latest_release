class RefreshTokenModel {
  final String accessToken, refreshToken;
  RefreshTokenModel({required this.accessToken, required this.refreshToken});
  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"accessToken": accessToken, "refreshToken": refreshToken};
  }
}
