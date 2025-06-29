import 'package:hive/hive.dart';

part 'learn_path_lesson_completed_model.g.dart';

@HiveType(typeId: 9)
class LearnPathLessonCompletedModel {
  @HiveField(0)
  final bool? isCompleted;

  @HiveField(1)
  final int lessonId;

  const LearnPathLessonCompletedModel({
    required this.isCompleted,
    required this.lessonId,
  });

  factory LearnPathLessonCompletedModel.fromJson(Map<String, dynamic> json) {
    return LearnPathLessonCompletedModel(
      lessonId: json['lessonId'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'lessonId': lessonId, 'isCompleted': isCompleted};
  }
}
