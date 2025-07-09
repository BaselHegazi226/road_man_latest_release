part of 'recent_jobs_cubit.dart';

@immutable
sealed class RecentJobsState {}

final class RecentJobsInitial extends RecentJobsState {}

final class RecentJobsLoading extends RecentJobsState {}

final class RecentJobsSuccess extends RecentJobsState {
  final List<JobModel> jobs;
  RecentJobsSuccess(this.jobs);
}

final class RecentJobsFailure extends RecentJobsState {
  final String errorMessage;
  RecentJobsFailure(this.errorMessage);
}
