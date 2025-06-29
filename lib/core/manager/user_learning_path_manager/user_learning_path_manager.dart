import 'package:hive/hive.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_answer_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_completed_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_user_answer_model.dart';

abstract class UserLearningPathHelper {
  static const String _learningPathBox = 'learningPathBox';
  static const String _lessonsBox = 'lessonsBox';
  static const String _quizzesBox = 'quizzesBox';
  static const String _answersBox = 'answersBox';
  static const String _userAnswersBox = 'userAnswersBox';
  static const String _completedLessonsBox = 'completedLessonsBox'; // قديم
  static const String _lessonCompletedModelsBox =
      'lessonCompletedModelsBox'; // جديد
  static const String _activeLevelBox = 'activeLevelIndexBox';
  static const String _activeLevelKey = 'activeLevelIndex';

  // Initialization
  static Future<void> initHiveBoxes() async {
    await Hive.openBox<LearnPathModel>(_learningPathBox);
    await Hive.openBox<LearnPathLessonModel>(_lessonsBox);
    await Hive.openBox<LearnPathQuizModel>(_quizzesBox);
    await Hive.openBox<LearnPathAnswerModel>(_answersBox);
    await Hive.openBox<LearnPathUserAnswerModel>(_userAnswersBox);
    await Hive.openBox<List<int>>(_completedLessonsBox); // legacy
    await Hive.openBox<LearnPathLessonCompletedModel>(
      _lessonCompletedModelsBox,
    );
    await Hive.openBox<int>(_activeLevelBox);
  }

  static Future<void> saveActiveLevelIndex(int index) async {
    final box = Hive.box<int>(_activeLevelBox);
    await box.put(_activeLevelKey, index);
  }

  // Save Learning Paths
  static Future<void> saveLearningPaths(List<LearnPathModel> list) async {
    final box = Hive.box<LearnPathModel>(_learningPathBox);
    for (var item in list) {
      await box.put(item.id, item);
    }
  }

  // Save Lessons
  static Future<void> saveLessons(List<LearnPathLessonModel> list) async {
    final box = Hive.box<LearnPathLessonModel>(_lessonsBox);
    for (var item in list) {
      await box.put(item.id, item);
    }
  }

  // Save Quizzes
  static Future<void> saveQuizzes(List<LearnPathQuizModel> list) async {
    final box = Hive.box<LearnPathQuizModel>(_quizzesBox);
    for (var item in list) {
      await box.put(item.id, item);
    }
  }

  // Save Answers
  static Future<void> saveAnswers(List<LearnPathAnswerModel> answers) async {
    final box = Hive.box<LearnPathAnswerModel>(_answersBox);
    for (final answer in answers) {
      await box.put(answer.id, answer);
    }
  }

  // Save User Answer
  static Future<void> saveUserAnswer(LearnPathUserAnswerModel answer) async {
    final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
    await box.put(answer.userAnswerId, answer);
  }

  static Future<void> saveUserAnswers(
    List<LearnPathUserAnswerModel> answers,
  ) async {
    final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
    for (final answer in answers) {
      await box.put(answer.userAnswerId, answer);
    }
  }

  // Legacy: Save lessonId under levelId
  static Future<void> saveCompletedLesson(int levelId, int lessonId) async {
    final box = Hive.box<List<int>>(_completedLessonsBox);
    List<int> existing = box.get(levelId, defaultValue: []) ?? [];
    if (!existing.contains(lessonId)) {
      existing.add(lessonId);
      await box.put(levelId, existing);
    }
  }

  // ✅ New: Save full lesson completed model
  static Future<void> saveLessonCompletedLocally(
    LearnPathLessonCompletedModel model,
  ) async {
    final box = Hive.box<LearnPathLessonCompletedModel>(
      _lessonCompletedModelsBox,
    );
    await box.put(model.lessonId, model);
  }

  static bool isLessonCompleted(int lessonId) {
    final box = Hive.box<LearnPathLessonCompletedModel>(
      _lessonCompletedModelsBox,
    );
    final model = box.get(lessonId);
    return model?.isCompleted ?? false;
  }

  static LearnPathLessonCompletedModel? getLessonCompletedModel(int lessonId) {
    final box = Hive.box<LearnPathLessonCompletedModel>(
      _lessonCompletedModelsBox,
    );
    return box.get(lessonId);
  }

  static int getActiveLevelIndex() {
    final box = Hive.box<int>(_activeLevelBox);
    return box.get(_activeLevelKey, defaultValue: 0) ?? 0;
  }

  static List<LearnPathLessonCompletedModel> getAllCompletedLessons() {
    final box = Hive.box<LearnPathLessonCompletedModel>(
      _lessonCompletedModelsBox,
    );
    return box.values.where((e) => e.isCompleted == true).toList();
  }

  static List<int> getCompletedLessons(int levelId) {
    final box = Hive.box<List<int>>(_completedLessonsBox);
    return box.get(levelId, defaultValue: []) ?? [];
  }

  // Getters
  static List<LearnPathModel> getAllLearningPaths() {
    return Hive.box<LearnPathModel>(_learningPathBox).values.toList();
  }

  static List<LearnPathLessonModel> getAllLessons() {
    return Hive.box<LearnPathLessonModel>(_lessonsBox).values.toList();
  }

  static List<LearnPathQuizModel> getAllQuizzes() {
    return Hive.box<LearnPathQuizModel>(_quizzesBox).values.toList();
  }

  static List<LearnPathAnswerModel> getAllAnswers() {
    return Hive.box<LearnPathAnswerModel>(_answersBox).values.toList();
  }

  static List<LearnPathUserAnswerModel> getAllUserAnswers() {
    return Hive.box<LearnPathUserAnswerModel>(_userAnswersBox).values.toList();
  }

  static LearnPathUserAnswerModel? getUserAnswerById(int answerId) {
    final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
    return box.get(answerId);
  }

  static Future<void> deleteAllData() async {
    await Hive.box<LearnPathModel>(_learningPathBox).clear();
    await Hive.box<LearnPathLessonModel>(_lessonsBox).clear();
    await Hive.box<LearnPathQuizModel>(_quizzesBox).clear();
    await Hive.box<LearnPathAnswerModel>(_answersBox).clear();
    await Hive.box<LearnPathUserAnswerModel>(_userAnswersBox).clear();
    await Hive.box<List<int>>(_completedLessonsBox).clear();
    await Hive.box<LearnPathLessonCompletedModel>(
      _lessonCompletedModelsBox,
    ).clear();
  }
}
