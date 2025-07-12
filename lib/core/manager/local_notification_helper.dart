import 'package:hive/hive.dart';
import 'package:road_man_project/features/_06_home_view/data/model/notification_model.dart';

abstract class LocalNotificationHelper {
  static const String _notificationsBox = 'notificationsBox';

  /// ✅ افتح الصندوق (يُفضل في بداية المشروع)
  static Future<void> initNotificationBox() async {
    await Hive.openBox<NotificationModel>(_notificationsBox);
  }

  /// ✅ احفظ الإشعارات كلها (عند أول تحميل من API)
  static Future<void> saveNotifications(List<NotificationModel> list) async {
    final box = Hive.box<NotificationModel>(_notificationsBox);
    await box.clear(); // امسح القديم الأول
    for (final notification in list) {
      await box.put(notification.id, notification);
    }
  }

  /// ✅ احصل على كل الإشعارات
  static List<NotificationModel> getAllNotifications() {
    final box = Hive.box<NotificationModel>(_notificationsBox);
    return box.values.toList();
  }

  /// ✅ حذف إشعار واحد محليًا
  static Future<void> deleteNotificationById(int id) async {
    final box = Hive.box<NotificationModel>(_notificationsBox);
    await box.delete(id);
  }

  /// ✅ حذف كل الإشعارات محليًا
  static Future<void> clearAllNotifications() async {
    final box = Hive.box<NotificationModel>(_notificationsBox);
    await box.clear();
  }

  /// ✅ هل توجد إشعارات حاليًا؟
  static bool hasNotifications() {
    final box = Hive.box<NotificationModel>(_notificationsBox);
    return box.isNotEmpty;
  }

  /// ✅ عدد الإشعارات
  static int getNotificationsCount() {
    final box = Hive.box<NotificationModel>(_notificationsBox);
    return box.length;
  }
}
