class SignInWithGoogleGetModel {
  final String token;
  final String refreshToken;
  final GoogleUser user;
  final GoogleMetadata metadata;

  SignInWithGoogleGetModel({
    required this.token,
    required this.refreshToken,
    required this.user,
    required this.metadata,
  });

  factory SignInWithGoogleGetModel.fromJson(Map<String, dynamic> json) {
    return SignInWithGoogleGetModel(
      token: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      user: GoogleUser.fromJson(json['user']),
      metadata: GoogleMetadata.fromJson(json['metadata']),
    );
  }
}

class GoogleUser {
  final int id;
  final String name;
  final String email;
  final String photoUrl;
  final dynamic authMethods; // ممكن تخليه nullable أو تعدله حسب نوعه الحقيقي

  GoogleUser({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    this.authMethods,
  });

  factory GoogleUser.fromJson(Map<String, dynamic> json) {
    return GoogleUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      authMethods: json['authMethods'],
    );
  }
}

class GoogleMetadata {
  final bool isNewUser;
  final dynamic firstLogin;

  GoogleMetadata({required this.isNewUser, this.firstLogin});

  factory GoogleMetadata.fromJson(Map<String, dynamic> json) {
    return GoogleMetadata(
      isNewUser: json['isNewUser'],
      firstLogin: json['firstLogin'],
    );
  }
}
