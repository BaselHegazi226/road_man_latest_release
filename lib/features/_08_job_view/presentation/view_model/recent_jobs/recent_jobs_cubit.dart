import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:road_man_project/features/_08_job_view/data/model/notification_model.dart';
import 'package:road_man_project/features/_08_job_view/data/repos/jobs_repo_implement.dart';

import '../../../../../core/manager/tokens_manager.dart';
import '../../../../_06_home_view/data/model/job_model.dart';

part 'recent_jobs_state.dart';

class RecentJobsCubit extends Cubit<RecentJobsState> {
  final JobsRepoImplement _jobsRepo;

  RecentJobsCubit(this._jobsRepo) : super(RecentJobsInitial());

  Future<void> fetchRecentJobs() async {
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

class NotificationCubit extends Cubit<NotificationsState> {
  final JobsRepoImplement _jobsRepo;

  NotificationCubit(this._jobsRepo) : super(NotificationInitial());

  Future<void> fetchAllNotification() async {
    emit(NotificationLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      if (userTokens != null) {
        var result = await _jobsRepo.getAllNotification(
          token: userTokens.token,
        );

        result.fold(
          (failure) {
            emit(NotificationFailure(failure.errorMessage ?? ''));
          },
          (notifications) {
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
