class ChangePasswordModel {
  final String oldPassword, newPassword, confirmPassword;
  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      oldPassword: json['oldPassword'],
      newPassword: json['newPassword'],
      confirmPassword: json['confirmPassword'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }
}
