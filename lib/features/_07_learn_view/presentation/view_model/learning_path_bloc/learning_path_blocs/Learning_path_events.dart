import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_question_model.dart';

import '../../../../data/model/learn_path_answer_model.dart';

abstract class LearningPathEvents {}

// Event to mark quiz as completed on server
class QuizCompletedEvent extends LearningPathEvents {
  final String userToken;
  final int quizId;
  final int questionsAnswered;

  QuizCompletedEvent({
    required this.userToken,
    required this.quizId,
    required this.questionsAnswered,
  });
}

// Event to mark lesson as completed on server
class LessonCompletedPostEvent extends LearningPathEvents {
  final String userToken;
  final int lessonId;

  LessonCompletedPostEvent({required this.userToken, required this.lessonId});
}

// Local: Save user's quiz answers locally
class SaveUserAnswersToLocalEvent extends LearningPathEvents {
  final int quizId;
  final List<LearningPathQuestionModel> questions;
  final LearnPathAnswerModel userAnswers;

  SaveUserAnswersToLocalEvent({
    required this.quizId,
    required this.userAnswers,
    required this.questions,
  });
}

// Local: Load user's quiz answers locally by quizId
class LoadUserAnswersFromLocalEvent extends LearningPathEvents {
  final int quizId;

  LoadUserAnswersFromLocalEvent({required this.quizId});
}
