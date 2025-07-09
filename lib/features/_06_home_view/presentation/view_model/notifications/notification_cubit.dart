import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo_implement.dart';

import '../../../../../core/manager/tokens_manager.dart';
import 'notification_states.dart';

class NotificationCubit extends Cubit<NotificationsState> {
  final HomeRepoImplement _homeRepoImpl;
  bool _hasFetched = false; // ✅ عشان نمنع التحميل الزائد

  NotificationCubit(this._homeRepoImpl) : super(NotificationInitial());

  Future<void> fetchAllNotification() async {
    if (_hasFetched) return; // ✅ لو اتحملت قبل كده، متحملهاش تاني

    emit(NotificationLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      if (userTokens != null) {
        var result = await _homeRepoImpl.getAllNotification(
          token: userTokens.token,
        );

        result.fold(
          (failure) {
            emit(NotificationFailure(failure.errorMessage ?? ''));
          },
          (notifications) {
            _hasFetched = true; // ✅ أول ما البيانات تجيبها، خزننا انها اتجابت
            emit(NotificationSuccess(notifications));
          },
        );
      } else {
        emit(NotificationFailure('User not authenticated. Please log in.'));
      }
    } catch (e) {
      emit(
        NotificationFailure('An unexpected error occurred: ${e.toString()}'),
      );
    }
  }
}
