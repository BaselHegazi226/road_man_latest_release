import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';

import '../../features/_09_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_image.dart';

class UserInfoStorageHelper {
  static const String _boxName = 'user_info';

  /// فتح صندوق Hive
  static Future<Box> _openBox() async {
    return await Hive.openBox(_boxName);
  }

  /// حفظ بيانات المستخدم باستخدام الموديل
  static Future<void> saveUserInfo(UserInfoModel user) async {
    final box = await _openBox();
    final data = user.toJson();

    final photoBase64 = data['photoBase64'];

    // ✅ حفظ الصورة من base64 إلى ملف مؤقت فريد، وخزن المسار فقط
    if (photoBase64 != null && photoBase64.toString().trim().isNotEmpty) {
      final fileName =
          'user_profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final tempFile = await base64ToTempFile(photoBase64, fileName);
      if (tempFile.existsSync()) {
        data['photo'] = tempFile.path;
      }
    }

    // ✅ لو مفيش لا صورة ولا base64 → امسحهم
    if ((data['photo'] == null || data['photo'].toString().trim().isEmpty) &&
        (photoBase64 == null || photoBase64.toString().trim().isEmpty)) {
      log('🧨 [saveUserInfo] لا يوجد صورة أو base64 → سيتم تجاهلهم');
      data.remove('photo');
      data.remove('photoBase64');
    } else {
      // ✅ تأكد من أن photoBase64 محفوظ دائمًا حتى لو photo null
      data['photoBase64'] = photoBase64;
    }

    for (final entry in data.entries) {
      await box.put(entry.key, entry.value);
    }

    log('✅ [saveUserInfo] تم حفظ بيانات المستخدم: ${data.toString()}');
  }

  /// استرجاع بيانات المستخدم كموديل
  static Future<UserInfoModel?> getUserInfo() async {
    final box = await _openBox();

    final data = {
      'userID': box.get('userID'),
      'name': box.get('name'),
      'email': box.get('email'),
      'photo': box.get('photo'),
      'photoBase64': box.get('photoBase64'), // ✅ استرجاع base64
      'dateOfBirth': box.get('dateOfBirth'),
    };

    if (data['userID'] == null ||
        data['name'] == null ||
        data['email'] == null) {
      log('❌ [getUserInfo] بيانات مهمة ناقصة (userID, name, email) → null');
      return null;
    }

    log('✅ [getUserInfo] تم استرجاع بيانات المستخدم: ${data.toString()}');
    return UserInfoModel.fromJson(data);
  }

  /// حذف بيانات المستخدم
  static Future<void> clearUserInfo() async {
    final box = await _openBox();
    await box.deleteAll([
      'userID',
      'name',
      'email',
      'photo',
      'photoBase64', // ✅ امسح base64 أيضًا
      'dateOfBirth',
    ]);
    log('🧹 [clearUserInfo] تم حذف بيانات المستخدم من Hive');
  }
}
