import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:road_man_project/features/_06_home_view/data/model/progress_model.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo_implement.dart';

import '../../../../../core/manager/tokens_manager.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit(this._homeRepoImplement) : super(ProgressInitial());

  final HomeRepoImplement _homeRepoImplement;

  bool _hasFetched = false; // ✅ علشان نمنع التحميل المكرر

  Future<void> fetchProgress() async {
    if (_hasFetched) return; // ✅ خلاص اتحمل قبل كده

    emit(ProgressLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      if (userTokens != null) {
        var result = await _homeRepoImplement.getProgress(
          token: userTokens.token,
        );

        result.fold(
          (failure) {
            emit(ProgressFailure(failure.errorMessage ?? ''));
          },
          (data) {
            _hasFetched = true; // ✅ اتعلم إنه اتحمل
            emit(ProgressSuccess(data));
          },
        );
      } else {
        emit(ProgressFailure('User not authenticated. Please log in.'));
      }
    } catch (e) {
      emit(ProgressFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  /// ✅ إعادة التهيئة إذا خرجنا من الصفحة وعايزين نحمل من جديد بعدين
}
