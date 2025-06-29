import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_user_answer_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo.dart';

import '../../../../../../core/manager/user_learning_path_manager/user_learning_path_manager.dart';
import '../../../../data/model/learn_path_lesson_completed_model.dart';
import 'learning_path_states.dart';

class LearningPathCubit extends Cubit<LearningPathStates> {
  final LearningPathRepo learningPathRepo;

  LearningPathCubit({required this.learningPathRepo})
    : super(LearningPathInitial());
  //get learning path function
  Future<Map<String, dynamic>> getLearningPathFun({
    required String userToken,
  }) async {
    Map<String, dynamic> data = {};
    emit(LearningPathLoading());

    final result = await learningPathRepo.getUserLearningPath(
      userToken: userToken,
    );
    await result.fold(
      (error) async {
        emit(
          LearningPathFailure(
            errorMessage: error.errorMessage ?? 'Unknown error',
          ),
        );
      },
      (success) async {
        data = success;
        emit(LearningPathSuccess(learningPath: success));
      },
    );
    return data;
  }

  //get lesson completed cubit
  Future<void> getLessonCompleted({
    required String userToken,
    required int lessonId,
  }) async {
    emit(LessonCompletedGetLoading());

    final result = await learningPathRepo.lessonCompletedGet(
      userToken: userToken,
      id: lessonId,
    );

    await result.fold(
      (error) async {
        emit(
          LessonCompletedGetFailure(
            errorMessage: error.errorMessage ?? 'Unknown error',
          ),
        );
      },
      (success) async {
        emit(LessonCompletedGetSuccess(learnPathLessonCompletedModel: success));

        // ✅ حفظ حالة الدرس في Hive بعد نجاح الجلب
        final model = LearnPathLessonCompletedModel.fromJson(success);
        await UserLearningPathHelper.saveLessonCompletedLocally(model);
      },
    );
  }

  Future<void> completeLessonAndRefreshLearningPath({
    required String userToken,
    required int lessonId,
  }) async {
    emit(LessonCompletedGetLoading());

    final result = await learningPathRepo.lessonCompletedGet(
      userToken: userToken,
      id: lessonId,
    );

    await result.fold(
      (error) async {
        emit(
          LessonCompletedGetFailure(
            errorMessage: error.errorMessage ?? 'Unknown error',
          ),
        );
      },
      (success) async {
        final model = LearnPathLessonCompletedModel.fromJson(success);
        await UserLearningPathHelper.saveLessonCompletedLocally(model);

        // ✅ نحدث Learning Path ونعمل emit
        final pathResult = await learningPathRepo.getUserLearningPath(
          userToken: userToken,
        );

        await pathResult.fold(
          (error) async {
            emit(
              LearningPathFailure(
                errorMessage: error.errorMessage ?? 'Unknown error',
              ),
            );
          },
          (data) async {
            emit(LearningPathSuccess(learningPath: data));
          },
        );
      },
    );
  }

  //get learning path local function
  Future<List<LearnPathModel>> getLearningPathLocalFun({
    required List<LearnPathModel> paths,
  }) async {
    List<LearnPathModel> data = [];

    final result = await learningPathRepo.getUserLearningPathLocal(
      paths: paths,
    );
    await result.fold(
      (error) async {
        emit(
          LearningPathLocalFailure(
            errorMessage: error.errorMessage ?? 'Unknown error',
          ),
        );
      },
      (success) async {
        data = success;
        emit(LearningPathLocalSuccess(learningPath: success));
      },
    );
    return data;
  }

  Future<void> getQuizCompleted({
    required int quizId,
    required String userToken,
  }) async {
    emit(QuizCompletedGetLoading());
    final result = await learningPathRepo.quizCompletedGet(
      userToken: userToken,
      quizId: quizId,
    );
    await result.fold(
      (error) async {
        emit(
          QuizCompletedGetFailure(
            errorMessage: error.errorMessage ?? 'unknown',
          ),
        );
      },
      (success) async {
        emit(QuizCompletedGetSuccess(finished: success));
      },
    );
  }

  Future<void> loadLocalQuizAnswers({required int quizId}) async {
    final result = await learningPathRepo.getLocalUserQuizAnswers(quizId);
    await result.fold(
      (error) async {
        emit(
          LocalDataQuizFailure(
            errorMessage: error.errorMessage ?? 'Unknown error',
          ),
        );
      },
      (answers) async {
        if (answers.isEmpty) {
          emit(
            LocalDataQuizFailure(
              errorMessage: "No saved answers for this quiz",
            ),
          );
          return;
        }

        final Map<int, int> selectedAnswers = {};
        int correctCount = 0;
        int incorrectCount = 0;

        for (var answer in answers) {
          selectedAnswers[answer.questionId] = answer.answerId;
          if (answer.isCorrect) {
            correctCount++;
          } else {
            incorrectCount++;
          }
        }

        emit(
          LocalDataQuizSuccess(
            selectedAnswers: selectedAnswers,
            correctCount: correctCount,
            incorrectCount: incorrectCount,
            isFinished: true,
          ),
        );
      },
    );
  }

  void submitAnswer({
    required int quizId,
    required int questionId,
    required int answerId,
    required bool isCorrect,
  }) {
    final userAnswer = LearnPathUserAnswerModel(
      quizId: quizId,
      questionId: questionId,
      answerId: answerId,
      userAnswerId: '${quizId}_$questionId',
      isCorrect: isCorrect,
    );
    UserLearningPathHelper.saveUserAnswer(userAnswer);
  }

  void submitAnswersInBatch({
    required int quizId,
    required List questions,
    required Map<int, int> selectedAnswers,
  }) {
    for (var question in questions) {
      final int questionId = question.id;
      final int? answerId = selectedAnswers[questionId];

      if (answerId != null) {
        final selectedAnswer = question.answers.firstWhere(
          (a) => a.id == answerId,
        );
        final isCorrect = selectedAnswer.isCorrect;

        final userAnswer = LearnPathUserAnswerModel(
          quizId: quizId,
          questionId: questionId,
          answerId: answerId,
          userAnswerId: '${quizId}_$questionId',
          isCorrect: isCorrect,
        );

        UserLearningPathHelper.saveUserAnswer(userAnswer);
      }
    }
  }
}
