import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:road_man_project/core/manager/user_learning_path_manager/user_learning_path_manager.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_question_model.dart';

import 'features/_00_road_man_app/road_man_app.dart';
import 'features/_07_learn_view/data/model/learn_path_answer_model.dart';
import 'features/_07_learn_view/data/model/learn_path_lesson_completed_model.dart'; // ⬅️ مهم!
import 'features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'features/_07_learn_view/data/model/learn_path_model.dart';
import 'features/_07_learn_view/data/model/learn_path_quiz_model.dart';
import 'features/_07_learn_view/data/model/learn_path_user_answer_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);

  Hive.registerAdapter(LearnPathModelAdapter());
  Hive.registerAdapter(LearnPathLessonModelAdapter());
  Hive.registerAdapter(LearnPathQuizModelAdapter());
  Hive.registerAdapter(LearningPathQuestionModelAdapter());
  Hive.registerAdapter(LearnPathAnswerModelAdapter());
  Hive.registerAdapter(LearnPathUserAnswerModelAdapter());
  Hive.registerAdapter(LearnPathLessonCompletedModelAdapter()); // ✅ أضف هذا

  await UserLearningPathHelper.initHiveBoxes();

  print('Hive setup completed successfully!');

  runApp(const RoadManApp());
}
