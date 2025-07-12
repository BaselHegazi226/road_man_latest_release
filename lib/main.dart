import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:road_man_project/core/manager/user_learning_path_manager.dart';
import 'package:road_man_project/core/utilities/app_get.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_question_model.dart';

import 'core/manager/local_notification_helper.dart';
import 'features/_00_road_man_app/road_man_app.dart';
import 'features/_07_learn_view/data/model/learn_path_answer_model.dart';
import 'features/_07_learn_view/data/model/learn_path_lesson_completed_model.dart'; // ⬅️ مهم!
import 'features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'features/_07_learn_view/data/model/learn_path_model.dart';
import 'features/_07_learn_view/data/model/learn_path_quiz_model.dart';
import 'features/_07_learn_view/data/model/learn_path_user_answer_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);

  // ✅ Register Hive Adapters
  Hive.registerAdapter(LearnPathModelAdapter());
  Hive.registerAdapter(LearnPathLessonModelAdapter());
  Hive.registerAdapter(LearnPathQuizModelAdapter());
  Hive.registerAdapter(LearningPathQuestionModelAdapter());
  Hive.registerAdapter(LearnPathAnswerModelAdapter());
  Hive.registerAdapter(LearnPathUserAnswerModelAdapter());
  Hive.registerAdapter(LearnPathLessonCompletedModelAdapter());

  // ✅ هذه أهم خطوة: نضمن أن التوكن تم تحميله قبل استخدامه في الصناديق
  try {
    await UserLearningPathHelper.ensureInitialized();
    await UserLearningPathHelper.initHiveBoxes();
  } catch (e) {
    print('⚠️ Hive boxes for learning path not initialized: $e');
  }

  await LocalNotificationHelper.initNotificationBox();

  print('✅ Hive setup completed successfully!');
  AppGet.setUp();

  runApp(const RoadManApp());
}
