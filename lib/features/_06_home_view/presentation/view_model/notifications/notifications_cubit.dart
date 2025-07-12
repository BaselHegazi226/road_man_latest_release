import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo_implement.dart';

import '../../../../../core/manager/local_notification_helper.dart';
import '../../../../../core/manager/tokens_manager.dart';
import '../../../data/model/notification_model.dart';
import 'notification_states.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final HomeRepoImplement _homeRepoImpl;
  bool _hasFetched = false; // ✅ عشان نمنع التحميل الزائد

  NotificationsCubit(this._homeRepoImpl) : super(NotificationInitial());

  Future<void> fetchAllNotification() async {
    if (_hasFetched) return;

    emit(NotificationLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      if (userTokens != null) {
        final result = await _homeRepoImpl.getAllNotification(
          token: userTokens.token,
        );

        result.fold(
          (failure) => emit(NotificationFailure(failure.errorMessage ?? '')),
          (notifications) async {
            _hasFetched = true;
            await LocalNotificationHelper.saveNotifications(
              notifications,
            ); // ✅ حفظ محلي
            emit(NotificationSuccess(notifications));
          },
        );
      } else {
        emit(NotificationFailure('User not authenticated. Please log in.'));
      }
    } catch (e) {
      emit(NotificationFailure('Unexpected error: ${e.toString()}'));
    }
  }

  /// ✅ تحميل من التخزين المحلي فقط
  void loadFromLocal() {
    final cached = LocalNotificationHelper.getAllNotifications();
    emit(NotificationSuccess(cached));
  }

  /// ✅ حذف محلي بعد حذف سيرفر
  void deleteLocally(int id) {
    final current =
        state is NotificationSuccess
            ? List<NotificationModel>.from(
              (state as NotificationSuccess).notifications,
            )
            : [];

    current.removeWhere((element) => element.id == id);
    LocalNotificationHelper.deleteNotificationById(id);
    emit(NotificationSuccess([]));
  }

  /// ✅ حذف الكل محليًا بعد نجاح حذف من السيرفر
  void clearAllLocally() {
    LocalNotificationHelper.clearAllNotifications();
    emit(NotificationSuccess([]));
  }
}
