import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:road_man_project/core/manager/tokens_manager.dart';

import '../../../data/model/job_model.dart';
import '../../../data/repos/home_repo_implement.dart';

part 'recommended_jobs_state.dart';

class RecommendedJobsCubit extends Cubit<RecommendedJobsState> {
  final HomeRepoImplement _homeRepoImplement;

  RecommendedJobsCubit(this._homeRepoImplement) : super(RecommendedJobsInitial());

  Future<void> fetchRecommendedJobs() async {
    emit(RecommendedJobsLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      if (userTokens != null) {
        var result = await _homeRepoImplement.getRecommendedJobs(token: userTokens.token);

        result.fold(
              (failure) {
            emit(RecommendedJobsFailure(failure.errorMessage ?? ''));
          },
              (jobs) {
            emit(RecommendedJobsSuccess(jobs));
          },
        );
      } else {
        emit(RecommendedJobsFailure('User not authenticated. Please log in.'));
      }
    } catch (e) {
      emit(RecommendedJobsFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}