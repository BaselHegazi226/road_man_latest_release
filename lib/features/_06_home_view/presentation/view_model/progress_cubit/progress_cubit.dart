import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:road_man_project/features/_06_home_view/data/model/progress_model.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/progress_repo_implement.dart';

import '../../../../../core/manager/tokens_manager.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit(this._progressRepoImplement) : super(ProgressInitial());

  final ProgressRepoImplement _progressRepoImplement;

  Future<void> fetchProgress() async {
    emit(ProgressLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      print('okkkkkkk');
      if (userTokens != null) {
        var result = await _progressRepoImplement.getProgress(token: userTokens.token);

        result.fold(
              (failure) {
            emit(ProgressFailure
              (failure.errorMessage ?? ''));
          },
              (data) {
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
}
