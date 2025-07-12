// import 'package:hive/hive.dart';
// import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_answer_model.dart';
// import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_completed_model.dart';
// import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';
// import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';
// import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_model.dart';
// import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_user_answer_model.dart';
//
// abstract class UserLearningPathHelper {
//   static const String _learningPathBox = 'learningPathBox';
//   static const String _lessonsBox = 'lessonsBox';
//   static const String _quizzesBox = 'quizzesBox';
//   static const String _answersBox = 'answersBox';
//   static const String _userAnswersBox = 'userAnswersBox';
//   static const String _completedLessonsBox = 'completedLessonsBox'; // قديم
//   static const String _lessonCompletedModelsBox =
//       'lessonCompletedModelsBox'; // جديد
//   static const String _activeLevelBox = 'activeLevelIndexBox';
//   static const String _activeLevelKey = 'activeLevelIndex';
//
//   // Initialization
//   static Future<void> initHiveBoxes() async {
//     await Hive.openBox<LearnPathModel>(_learningPathBox);
//     await Hive.openBox<LearnPathLessonModel>(_lessonsBox);
//     await Hive.openBox<LearnPathQuizModel>(_quizzesBox);
//     await Hive.openBox<LearnPathAnswerModel>(_answersBox);
//     await Hive.openBox<LearnPathUserAnswerModel>(_userAnswersBox);
//     await Hive.openBox<List<int>>(_completedLessonsBox); // legacy
//     await Hive.openBox<LearnPathLessonCompletedModel>(
//       _lessonCompletedModelsBox,
//     );
//     await Hive.openBox<int>(_activeLevelBox);
//   }
//
//   static Future<void> saveActiveLevelIndex(int index) async {
//     final box = Hive.box<int>(_activeLevelBox);
//     await box.put(_activeLevelKey, index);
//   }
//
//   // Save Learning Paths
//   static Future<void> saveLearningPaths(List<LearnPathModel> list) async {
//     final box = Hive.box<LearnPathModel>(_learningPathBox);
//     for (var item in list) {
//       await box.put(item.id, item);
//     }
//
//     // 🧪 طباعة للتأكد من التخزين
//     final storedPaths = box.values.toList();
//     print('✅ Stored learning paths count = ${storedPaths.length}');
//     print('✅ Stored learning paths data = $storedPaths');
//   }
//
//   // Save Lessons
//   static Future<void> saveLessons(List<LearnPathLessonModel> list) async {
//     final box = Hive.box<LearnPathLessonModel>(_lessonsBox);
//     for (var item in list) {
//       await box.put(item.id, item);
//     }
//   }
//
//   // Save Quizzes
//   static Future<void> saveQuizzes(List<LearnPathQuizModel> list) async {
//     final box = Hive.box<LearnPathQuizModel>(_quizzesBox);
//     for (var item in list) {
//       await box.put(item.id, item);
//     }
//   }
//
//   // Save Answers
//   static Future<void> saveAnswers(List<LearnPathAnswerModel> answers) async {
//     final box = Hive.box<LearnPathAnswerModel>(_answersBox);
//     for (final answer in answers) {
//       await box.put(answer.id, answer);
//     }
//   }
//
//   // Save User Answer
//   static Future<void> saveUserAnswer(LearnPathUserAnswerModel answer) async {
//     final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
//     await box.put(answer.userAnswerId, answer);
//   }
//
//   static Future<void> saveUserAnswers(
//     List<LearnPathUserAnswerModel> answers,
//   ) async {
//     final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
//     for (final answer in answers) {
//       await box.put(answer.userAnswerId, answer);
//     }
//   }
//
//   // Legacy: Save lessonId under levelId
//   static Future<void> saveCompletedLesson(int levelId, int lessonId) async {
//     final box = Hive.box<List<int>>(_completedLessonsBox);
//     List<int> existing = box.get(levelId, defaultValue: []) ?? [];
//     if (!existing.contains(lessonId)) {
//       existing.add(lessonId);
//       await box.put(levelId, existing);
//     }
//   }
//
//   // الدالة الجديدة لحساب المستوى النشط بناءً على التقدم الفعلي
//   static int calculateActiveLevelIndex() {
//     final paths = getAllLearningPaths();
//     int lastCompleted = -1;
//     for (int i = 0; i < paths.length; i++) {
//       if (paths[i].progressStatus == 100) {
//         lastCompleted = i;
//       } else {
//         break;
//       }
//     }
//     return (lastCompleted + 1).clamp(0, paths.length - 1);
//   }
//
//   // ✅ New: Save full lesson completed model
//   static Future<void> saveLessonCompletedLocally(
//     LearnPathLessonCompletedModel model,
//   ) async {
//     final box = Hive.box<LearnPathLessonCompletedModel>(
//       _lessonCompletedModelsBox,
//     );
//     await box.put(model.lessonId, model);
//   }
//
//   static bool isLessonCompleted(int lessonId) {
//     final box = Hive.box<LearnPathLessonCompletedModel>(
//       _lessonCompletedModelsBox,
//     );
//     final model = box.get(lessonId);
//     return model?.isCompleted ?? false;
//   }
//
//   static LearnPathLessonCompletedModel? getLessonCompletedModel(int lessonId) {
//     final box = Hive.box<LearnPathLessonCompletedModel>(
//       _lessonCompletedModelsBox,
//     );
//     return box.get(lessonId);
//   }
//
//   static int getActiveLevelIndex() {
//     final box = Hive.box<int>(_activeLevelBox);
//     return box.get(_activeLevelKey, defaultValue: 0) ?? 0;
//   }
//
//   static List<LearnPathLessonCompletedModel> getAllCompletedLessons() {
//     final box = Hive.box<LearnPathLessonCompletedModel>(
//       _lessonCompletedModelsBox,
//     );
//     return box.values.where((e) => e.isCompleted == true).toList();
//   }
//
//   static List<int> getCompletedLessons(int levelId) {
//     final box = Hive.box<List<int>>(_completedLessonsBox);
//     return box.get(levelId, defaultValue: []) ?? [];
//   }
//
//   // Getters
//   static List<LearnPathModel> getAllLearningPaths() {
//     return Hive.box<LearnPathModel>(_learningPathBox).values.toList();
//   }
//
//   static List<LearnPathLessonModel> getAllLessons() {
//     return Hive.box<LearnPathLessonModel>(_lessonsBox).values.toList();
//   }
//
//   static List<LearnPathQuizModel> getAllQuizzes() {
//     return Hive.box<LearnPathQuizModel>(_quizzesBox).values.toList();
//   }
//
//   static List<LearnPathAnswerModel> getAllAnswers() {
//     return Hive.box<LearnPathAnswerModel>(_answersBox).values.toList();
//   }
//
//   static List<LearnPathUserAnswerModel> getAllUserAnswers() {
//     return Hive.box<LearnPathUserAnswerModel>(_userAnswersBox).values.toList();
//   }
//
//   static LearnPathUserAnswerModel? getUserAnswerById(int answerId) {
//     final box = Hive.box<LearnPathUserAnswerModel>(_userAnswersBox);
//     return box.get(answerId);
//   }
//
//   static Future<void> deleteAllData() async {
//     await Hive.box<LearnPathModel>(_learningPathBox).clear();
//     await Hive.box<LearnPathLessonModel>(_lessonsBox).clear();
//     await Hive.box<LearnPathQuizModel>(_quizzesBox).clear();
//     await Hive.box<LearnPathAnswerModel>(_answersBox).clear();
//     await Hive.box<LearnPathUserAnswerModel>(_userAnswersBox).clear();
//     await Hive.box<List<int>>(_completedLessonsBox).clear();
//     await Hive.box<LearnPathLessonCompletedModel>(
//       _lessonCompletedModelsBox,
//     ).clear();
//   }
// }
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'package:road_man_project/core/manager/tokens_manager.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_answer_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_completed_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_user_answer_model.dart';

abstract class UserLearningPathHelper {
  static String? _tokenHash;

  static Future<void> ensureInitialized() async {
    if (_tokenHash != null) return;

    final model = await SecureStorageHelper.getUserTokens();
    final token = model?.token;

    if (token == null) {
      throw Exception('[LearningPathHelper] User token is missing!');
    }

    // إنشاء hash آمن للتوكن
    _tokenHash = sha1.convert(utf8.encode(token)).toString();
  }

  static String _boxName(String suffix) => '${suffix}_$_tokenHash';

  static Future<void> initHiveBoxes() async {
    await ensureInitialized();
    await Hive.openBox<LearnPathModel>(_boxName('learningPathBox'));
    await Hive.openBox<LearnPathLessonModel>(_boxName('lessonsBox'));
    await Hive.openBox<LearnPathQuizModel>(_boxName('quizzesBox'));
    await Hive.openBox<LearnPathAnswerModel>(_boxName('answersBox'));
    await Hive.openBox<LearnPathUserAnswerModel>(_boxName('userAnswersBox'));
    await Hive.openBox<List<int>>(_boxName('completedLessonsBox'));
    await Hive.openBox<LearnPathLessonCompletedModel>(
      _boxName('lessonCompletedModelsBox'),
    );
    await Hive.openBox<int>(_boxName('activeLevelBox'));
  }

  static Future<void> saveActiveLevelIndex(int index) async {
    final box = Hive.box<int>(_boxName('activeLevelBox'));
    await box.put('activeLevelIndex', index);
  }

  static Future<void> saveLearningPaths(List<LearnPathModel> list) async {
    final box = Hive.box<LearnPathModel>(_boxName('learningPathBox'));
    for (var item in list) {
      await box.put(item.id, item);
    }
  }

  static Future<void> saveLessons(List<LearnPathLessonModel> list) async {
    final box = Hive.box<LearnPathLessonModel>(_boxName('lessonsBox'));
    for (var item in list) {
      await box.put(item.id, item);
    }
  }

  static Future<void> saveQuizzes(List<LearnPathQuizModel> list) async {
    final box = Hive.box<LearnPathQuizModel>(_boxName('quizzesBox'));
    for (var item in list) {
      await box.put(item.id, item);
    }
  }

  static Future<void> saveAnswers(List<LearnPathAnswerModel> answers) async {
    final box = Hive.box<LearnPathAnswerModel>(_boxName('answersBox'));
    for (final answer in answers) {
      await box.put(answer.id, answer);
    }
  }

  static Future<void> saveUserAnswer(LearnPathUserAnswerModel answer) async {
    final box = Hive.box<LearnPathUserAnswerModel>(_boxName('userAnswersBox'));
    await box.put(answer.userAnswerId, answer);
  }

  static Future<void> saveUserAnswers(
    List<LearnPathUserAnswerModel> answers,
  ) async {
    final box = Hive.box<LearnPathUserAnswerModel>(_boxName('userAnswersBox'));
    for (final answer in answers) {
      await box.put(answer.userAnswerId, answer);
    }
  }

  static Future<void> saveCompletedLesson(int levelId, int lessonId) async {
    final box = Hive.box<List<int>>(_boxName('completedLessonsBox'));
    List<int> existing = box.get(levelId, defaultValue: []) ?? [];
    if (!existing.contains(lessonId)) {
      existing.add(lessonId);
      await box.put(levelId, existing);
    }
  }

  static int calculateActiveLevelIndex() {
    final paths = getAllLearningPaths();
    int lastCompleted = -1;
    for (int i = 0; i < paths.length; i++) {
      if (paths[i].progressStatus == 100) {
        lastCompleted = i;
      } else {
        break;
      }
    }
    return (lastCompleted + 1).clamp(0, paths.length - 1);
  }

  static Future<void> saveLessonCompletedLocally(
    LearnPathLessonCompletedModel model,
  ) async {
    final box = Hive.box<LearnPathLessonCompletedModel>(
      _boxName('lessonCompletedModelsBox'),
    );
    await box.put(model.lessonId, model);
  }

  static bool isLessonCompleted(int lessonId) {
    final box = Hive.box<LearnPathLessonCompletedModel>(
      _boxName('lessonCompletedModelsBox'),
    );
    final model = box.get(lessonId);
    return model?.isCompleted ?? false;
  }

  static LearnPathLessonCompletedModel? getLessonCompletedModel(int lessonId) {
    final box = Hive.box<LearnPathLessonCompletedModel>(
      _boxName('lessonCompletedModelsBox'),
    );
    return box.get(lessonId);
  }

  static int getActiveLevelIndex() {
    final box = Hive.box<int>(_boxName('activeLevelBox'));
    return box.get('activeLevelIndex', defaultValue: 0) ?? 0;
  }

  static List<LearnPathLessonCompletedModel> getAllCompletedLessons() {
    final box = Hive.box<LearnPathLessonCompletedModel>(
      _boxName('lessonCompletedModelsBox'),
    );
    return box.values.where((e) => e.isCompleted == true).toList();
  }

  static List<int> getCompletedLessons(int levelId) {
    final box = Hive.box<List<int>>(_boxName('completedLessonsBox'));
    return box.get(levelId, defaultValue: []) ?? [];
  }

  static List<LearnPathModel> getAllLearningPaths() {
    return Hive.box<LearnPathModel>(
      _boxName('learningPathBox'),
    ).values.toList();
  }

  static List<LearnPathLessonModel> getAllLessons() {
    return Hive.box<LearnPathLessonModel>(
      _boxName('lessonsBox'),
    ).values.toList();
  }

  static List<LearnPathQuizModel> getAllQuizzes() {
    return Hive.box<LearnPathQuizModel>(_boxName('quizzesBox')).values.toList();
  }

  static List<LearnPathAnswerModel> getAllAnswers() {
    return Hive.box<LearnPathAnswerModel>(
      _boxName('answersBox'),
    ).values.toList();
  }

  static List<LearnPathUserAnswerModel> getAllUserAnswers() {
    return Hive.box<LearnPathUserAnswerModel>(
      _boxName('userAnswersBox'),
    ).values.toList();
  }

  static LearnPathUserAnswerModel? getUserAnswerById(int answerId) {
    final box = Hive.box<LearnPathUserAnswerModel>(_boxName('userAnswersBox'));
    return box.get(answerId);
  }

  static Future<void> deleteAllData() async {
    await Hive.box<LearnPathModel>(_boxName('learningPathBox')).clear();
    await Hive.box<LearnPathLessonModel>(_boxName('lessonsBox')).clear();
    await Hive.box<LearnPathQuizModel>(_boxName('quizzesBox')).clear();
    await Hive.box<LearnPathAnswerModel>(_boxName('answersBox')).clear();
    await Hive.box<LearnPathUserAnswerModel>(
      _boxName('userAnswersBox'),
    ).clear();
    await Hive.box<List<int>>(_boxName('completedLessonsBox')).clear();
    await Hive.box<LearnPathLessonCompletedModel>(
      _boxName('lessonCompletedModelsBox'),
    ).clear();
  }
}
