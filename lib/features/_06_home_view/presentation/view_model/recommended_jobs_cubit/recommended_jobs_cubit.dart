import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/manager/tokens_manager.dart';
import '../../../data/model/job_model.dart';
import '../../../data/repos/home_repo_implement.dart';

part 'recommended_jobs_state.dart';

class RecommendedJobsCubit extends Cubit<RecommendedJobsState> {
  final HomeRepoImplement _homeRepoImplement;
  bool _hasFetched = false;

  RecommendedJobsCubit(this._homeRepoImplement)
    : super(RecommendedJobsInitial());

  Future<void> fetchRecommendedJobs() async {
    // ✅ لو اتحملت قبل كده، متحملهاش تاني
    if (_hasFetched) return;

    emit(RecommendedJobsLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      if (userTokens != null) {
        final result = await _homeRepoImplement.getRecommendedJobs(
          token: userTokens.token,
        );

        result.fold(
          (failure) {
            emit(RecommendedJobsFailure(failure.errorMessage ?? ''));
          },
          (newJobs) {
            // ✅ لو الحالة السابقة كانت Success، قارن البيانات
            if (state is RecommendedJobsSuccess) {
              final currentJobs = (state as RecommendedJobsSuccess).jobs;
              if (_areJobsEqual(currentJobs, newJobs)) return;
            }

            _hasFetched = true; // ✅ نعلم إنه اتحمل
            emit(RecommendedJobsSuccess(newJobs));
          },
        );
      } else {
        emit(RecommendedJobsFailure('User not authenticated. Please log in.'));
      }
    } catch (e) {
      emit(RecommendedJobsFailure('Unexpected error: ${e.toString()}'));
    }
  }

  bool _areJobsEqual(List<JobModel> a, List<JobModel> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
