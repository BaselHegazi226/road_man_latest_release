import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo_implement.dart';

import 'delete_notification_by_id_event.dart';
import 'delete_notification_by_id_state.dart';

class DeleteNotificationByIdBloc
    extends Bloc<DeleteNotificationByIdEvent, DeleteNotificationByIdStates> {
  final HomeRepoImplement homeRepoImplement;

  DeleteNotificationByIdBloc({required this.homeRepoImplement})
    : super(DeleteNotificationByIdInitial()) {
    on<DeleteNotificationByIdEvent>(_onDeleteNotificationByIdEvent);
  }

  Future<void> _onDeleteNotificationByIdEvent(
    DeleteNotificationByIdEvent event,
    Emitter<DeleteNotificationByIdStates> emit,
  ) async {
    emit(DeleteNotificationByIdLoading(id: event.id));
    final result = await homeRepoImplement.deleteNotificationById(id: event.id);
    await result.fold(
      (error) async {
        return emit(
          DeleteNotificationByIdFailure(
            errorMessage: error.errorMessage ?? 'unknown',
          ),
        );
      },
      (success) async {
        return emit(DeleteNotificationByIdSuccess(id: event.id));
      },
    );
  }
}
