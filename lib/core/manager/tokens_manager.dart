import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/_03_auth_view/data/model/user_token_model.dart';

class SecureStorageHelper {
  // إنشاء instance من SecureStorage
  static final _storage = FlutterSecureStorage();

  // دالة لتخزين التوكنات وتواريخ انتهاء الصلاحية
  static Future<void> saveUserTokens(UserTokensModel userToken) async {
    // حفظ التوكن في التخزين
    await _storage.write(key: 'token', value: userToken.token);

    // حفظ الريفرش توكن
    await _storage.write(key: 'refreshToken', value: userToken.refreshToken);

    // حساب تاريخ انتهاء التوكن (23 ساعة و30 دقيقة)
    final expirationDate = DateTime.now().add(Duration(hours: 23, minutes: 30));

    // تخزين تاريخ انتهاء التوكن
    await _storage.write(
      key: 'tokenExpiration',
      value: expirationDate.toIso8601String(),
    );

    // حساب تاريخ انتهاء الريفرش توكن (13 يوم و23 ساعة و30 دقيقة)
    final refreshTokenExpiration = DateTime.now().add(
      Duration(days: 13, hours: 23, minutes: 30),
    );

    // تخزين تاريخ انتهاء صلاحية الريفرش توكن
    await _storage.write(
      key: 'refreshTokenExpiration',
      value: refreshTokenExpiration.toIso8601String(),
    );
  }

  // دالة للحصول على التوكنات فقط (بدون التحقق من صلاحيتها)
  static Future<UserTokensModel?> getUserTokens() async {
    // قراءة التوكن والريفرش توكن من التخزين
    String? token = await _storage.read(key: 'token');
    String? refreshToken = await _storage.read(key: 'refreshToken');

    // التحقق من وجود القيم وإرجاعها
    if (token != null && refreshToken != null) {
      return UserTokensModel(token: token, refreshToken: refreshToken);
    }

    // إرجاع null في حال عدم وجود التوكنات
    return null;
  }

  // دالة للحصول على تاريخ انتهاء التوكن
  static Future<DateTime> getUserTokenExpiration() async {
    // قراءة تاريخ انتهاء التوكن
    String? expiration = await _storage.read(key: 'tokenExpiration');

    // تحويل النص إلى تاريخ إذا كان موجوداً
    if (expiration != null) {
      return DateTime.parse(expiration);
    }

    // رمي استثناء في حال عدم وجود التاريخ
    throw Exception("Token expiration not found");
  }

  // دالة لمسح كل التوكنات من التخزين
  static Future<void> clearTokens() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'tokenExpiration');
    await _storage.delete(key: 'refreshTokenExpiration');
  }
}
