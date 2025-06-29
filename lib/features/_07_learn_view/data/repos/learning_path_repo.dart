import 'package:dartz/dartz.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';

import '../../../../core/error/failure.dart';
import '../model/learn_path_user_answer_model.dart';

abstract class LearningPathRepo {
  Future<Either<Failure, Map<String, dynamic>>> getUserLearningPath({
    required String userToken,
  });
  Future<Either<Failure, List<LearnPathModel>>> getUserLearningPathLocal({
    required List<LearnPathModel> paths,
  });
  Future<Either<Failure, bool>> quizCompletedPost({
    required String userToken,
    required int id,
    required int questionsAnswered,
  });
  Future<Either<Failure, bool>> quizCompletedGet({
    required String userToken,
    required int quizId,
  });
  Future<Either<Failure, bool>> lessonCompletedPost({
    required String userToken,
    required int id,
  });
  Future<Either<Failure, Map<String, dynamic>>> lessonCompletedGet({
    required String userToken,
    required int id,
  });
  Future<Either<Failure, List<LearnPathUserAnswerModel>>>
  getLocalUserQuizAnswers(int quizId);
}
