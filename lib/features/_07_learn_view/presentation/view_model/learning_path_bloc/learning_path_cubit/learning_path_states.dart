import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';

abstract class LearningPathStates {}

// Initial
class LearningPathInitial extends LearningPathStates {}

// Generic Loading/Failure/Success
class LearningPathLoading extends LearningPathStates {}

class LearningPathFailure extends LearningPathStates {
  final String errorMessage;
  LearningPathFailure({required this.errorMessage});
}

class LearningPathSuccess extends LearningPathStates {
  final Map<String, dynamic> learningPath;
  LearningPathSuccess({required this.learningPath});
}

// Quiz Completed States
class QuizCompletedPostInitial extends LearningPathStates {}

class QuizCompletedPostFailure extends LearningPathStates {
  final String errorMessage;
  QuizCompletedPostFailure({required this.errorMessage});
}

class QuizCompletedPostLoading extends LearningPathStates {}

class QuizCompletedPostSuccess extends LearningPathStates {
  final bool finished;
  QuizCompletedPostSuccess({required this.finished});
}

// Quiz Completed States
class QuizCompletedGetInitial extends LearningPathStates {}

class QuizCompletedGetFailure extends LearningPathStates {
  final String errorMessage;
  QuizCompletedGetFailure({required this.errorMessage});
}

class QuizCompletedGetLoading extends LearningPathStates {}

class QuizCompletedGetSuccess extends LearningPathStates {
  final bool finished;
  QuizCompletedGetSuccess({required this.finished});
}

// Lesson Completed Post States
class LessonCompletedPostInitial extends LearningPathStates {}

class LessonCompletedPostFailure extends LearningPathStates {
  final String errorMessage;
  LessonCompletedPostFailure({required this.errorMessage});
}

class LessonCompletedPostLoading extends LearningPathStates {}

class LessonCompletedPostSuccess extends LearningPathStates {
  final int lessonId;
  LessonCompletedPostSuccess({required this.lessonId});
}

// Lesson Completed Get States
class LessonCompletedGetInitial extends LearningPathStates {}

class LessonCompletedGetFailure extends LearningPathStates {
  final String errorMessage;
  LessonCompletedGetFailure({required this.errorMessage});
}

class LessonCompletedGetLoading extends LearningPathStates {}

class LessonCompletedGetSuccess extends LearningPathStates {
  final Map<String, dynamic> learnPathLessonCompletedModel;
  LessonCompletedGetSuccess({required this.learnPathLessonCompletedModel});
}

// Save User Quiz Answer Local
class SaveUserQuizAnswerFailure extends LearningPathStates {
  final String errorMessage;
  SaveUserQuizAnswerFailure({required this.errorMessage});
}

class SaveUserQuizAnswerSuccess extends LearningPathStates {}

// Load User Quiz Answers Local
class LoadUserAnswersFromLocalFailure extends LearningPathStates {
  final String errorMessage;
  LoadUserAnswersFromLocalFailure({required this.errorMessage});
}

class LoadUserAnswersFromLocalSuccess extends LearningPathStates {
  final Map<int, Map<String, dynamic>> userAnswers;
  LoadUserAnswersFromLocalSuccess({required this.userAnswers});
}

//get Learning path local states

class LearningPathLocalFailure extends LearningPathStates {
  final String errorMessage;
  LearningPathLocalFailure({required this.errorMessage});
}

class LearningPathLocalSuccess extends LearningPathStates {
  final List<LearnPathModel> learningPath;
  LearningPathLocalSuccess({required this.learningPath});
}

// local data quiz states
class LocalDataQuizSuccess extends LearningPathStates {
  final Map<int, int> selectedAnswers;
  final int correctCount;
  final int incorrectCount;
  final bool isFinished;

  LocalDataQuizSuccess({
    required this.selectedAnswers,
    required this.correctCount,
    required this.incorrectCount,
    required this.isFinished,
  });
}

class LocalDataQuizFailure extends LearningPathStates {
  final String errorMessage;
  LocalDataQuizFailure({required this.errorMessage});
}
