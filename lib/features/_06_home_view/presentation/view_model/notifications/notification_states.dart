//notifications states
import '../../../data/model/notification_model.dart';

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
