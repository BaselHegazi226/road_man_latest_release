//Delete Notification By Id states
sealed class DeleteNotificationByIdStates {}

class DeleteNotificationByIdInitial extends DeleteNotificationByIdStates {}

class DeleteNotificationByIdLoading extends DeleteNotificationByIdStates {
  final int id;
  DeleteNotificationByIdLoading({required this.id});
}

class DeleteNotificationByIdFailure extends DeleteNotificationByIdStates {
  final String errorMessage;
  DeleteNotificationByIdFailure({required this.errorMessage});
}

class DeleteNotificationByIdSuccess extends DeleteNotificationByIdStates {
  final int id;
  DeleteNotificationByIdSuccess({required this.id});
}
