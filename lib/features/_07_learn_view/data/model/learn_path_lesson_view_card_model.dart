import 'package:hive/hive.dart';
part 'learn_path_lesson_view_card_model.g.dart'; // قم بإضافة هذا الجزء
@HiveType(typeId: 6)
class LearnPathLessonViewCardModel {
  @HiveField(0)
  final String lessonNumber;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String estimatedDuration;

  @HiveField(3)
  final bool isAvailable;

  const LearnPathLessonViewCardModel({
    required this.lessonNumber,
    required this.title,
    required this.estimatedDuration,
    this.isAvailable = false,
  });
}
