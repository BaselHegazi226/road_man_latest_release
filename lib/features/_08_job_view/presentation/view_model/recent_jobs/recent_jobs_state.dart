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

//notification states
sealed class NotificationsState {}

final class NotificationInitial extends NotificationsState {}

final class NotificationLoading extends NotificationsState {}

final class NotificationSuccess extends NotificationsState {
  final List<NotificationModel> notifications;
  NotificationSuccess(this.notifications);
}

final class NotificationFailure extends NotificationsState {
  final String errorMessage;
  NotificationFailure(this.errorMessage);
}
