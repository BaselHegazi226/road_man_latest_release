abstract class DeleteAllNotificationsState {}

//Delete All Notifications States
class DeleteAllNotificationsInitial extends DeleteAllNotificationsState {}

class DeleteAllNotificationsLoading extends DeleteAllNotificationsState {}

class DeleteAllNotificationsFailure extends DeleteAllNotificationsState {
  final String errorMessage;
  DeleteAllNotificationsFailure({required this.errorMessage});
}

class DeleteAllNotificationsSuccess extends DeleteAllNotificationsState {}


