import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo_implement.dart';

import 'delete_all_notifications_event.dart';
import 'delete_all_notifications_state.dart';

class DeleteAllNotificationsBloc
    extends Bloc<DeleteAllNotificationsEvent, DeleteAllNotificationsState> {
  final HomeRepoImplement homeRepoImplement;

  DeleteAllNotificationsBloc({required this.homeRepoImplement})
    : super(DeleteAllNotificationsInitial()) {
    on<DeleteAllNotificationsEvent>(_onDeleteAllNotificationsEvent);
  }
  Future<void> _onDeleteAllNotificationsEvent(
    DeleteAllNotificationsEvent event,
    Emitter<DeleteAllNotificationsState> emit,
  ) async {
    emit(DeleteAllNotificationsLoading());
    final result = await homeRepoImplement.deleteAllNotifications();
    await result.fold(
      (error) async {
        return emit(
          DeleteAllNotificationsFailure(
            errorMessage: error.errorMessage ?? 'unknown',
          ),
        );
      },
      (success) async {
        return emit(DeleteAllNotificationsSuccess());
      },
    );
  }
}
