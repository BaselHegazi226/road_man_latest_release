// class UserGoogleTokenModel {
//   final String token, refreshToken, photo, id, name, email;
//   UserGoogleTokenModel({
//     required this.token,
//     required this.refreshToken,
//     required this.photo,
//     required this.id,
//     required this.name,
//     required this.email,
//   });
//   factory UserGoogleTokenModel.fromJson(Map<String, dynamic> json) {
//     return UserGoogleTokenModel(
//       token: json['token'],
//       refreshToken: json['refreshToken'],
//       id: json['user']['id'],
//       name: json['user']['name'],
//       email: json['user']['email'],
//       photo: json['user']['photo'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "token": token,
//       "refreshToken": refreshToken,
//       'id': id,
//       'email': email,
//       'name': name,
//       'photo': photo,
//     };
//   }
// }
