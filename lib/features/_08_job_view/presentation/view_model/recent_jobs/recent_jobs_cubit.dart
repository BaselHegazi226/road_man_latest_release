import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:road_man_project/features/_08_job_view/data/repos/jobs_repo_implement.dart';

import '../../../../../core/manager/tokens_manager.dart';
import '../../../../_06_home_view/data/model/job_model.dart';

part 'recent_jobs_state.dart';

class RecentJobsCubit extends Cubit<RecentJobsState> {
  final JobsRepoImplement _jobsRepo;
  bool _hasFetched = false;

  RecentJobsCubit(this._jobsRepo) : super(RecentJobsInitial());

  Future<void> fetchRecentJobs() async {
    if (_hasFetched) return;

    emit(RecentJobsLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      if (userTokens != null) {
        var result = await _jobsRepo.getRecentJobs(token: userTokens.token);

        result.fold(
          (failure) {
            emit(RecentJobsFailure(failure.errorMessage ?? ''));
          },
          (jobs) {
            _hasFetched = true;
            emit(RecentJobsSuccess(jobs));
          },
        );
      } else {
        emit(RecentJobsFailure('User not authenticated. Please log in.'));
      }
    } catch (e) {
      emit(RecentJobsFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
