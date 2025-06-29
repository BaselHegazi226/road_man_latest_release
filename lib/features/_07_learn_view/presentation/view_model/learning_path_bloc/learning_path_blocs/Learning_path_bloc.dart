import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit/learning_path_states.dart';

import 'Learning_path_events.dart';

class LearningPathBloc extends Bloc<LearningPathEvents, LearningPathStates> {
  final LearningPathRepo learningPathRepo;

  LearningPathBloc({required this.learningPathRepo})
    : super(LearningPathInitial()) {
    on<QuizCompletedEvent>(_onQuizCompletedEvent);
    on<LessonCompletedPostEvent>(_onLessonCompletedEvent);
  }

  Future<void> _onQuizCompletedEvent(
    QuizCompletedEvent event,
    Emitter<LearningPathStates> emit,
  ) async {
    emit(QuizCompletedPostLoading());
    final result = await learningPathRepo.quizCompletedPost(
      userToken: event.userToken,
      id: event.quizId,
      questionsAnswered: event.questionsAnswered,
    );
    await result.fold(
      (error) async {
        return emit(
          QuizCompletedPostFailure(
            errorMessage: error.errorMessage ?? 'UnKnown error',
          ),
        );
      },
      (success) async {
        return emit(QuizCompletedPostSuccess(finished: true));
      },
    );
  }

  Future<void> _onLessonCompletedEvent(
    LessonCompletedPostEvent event,
    Emitter<LearningPathStates> emit,
  ) async {
    emit(LessonCompletedPostLoading());
    final result = await learningPathRepo.lessonCompletedPost(
      userToken: event.userToken,
      id: event.lessonId,
    );
    await result.fold(
      (error) async {
        return emit(
          LessonCompletedPostFailure(
            errorMessage: error.errorMessage ?? 'UnKnown error',
          ),
        );
      },
      (success) async {
        return emit(LessonCompletedPostSuccess(lessonId: event.lessonId));
      },
    );
  }
}
