import 'package:hive/hive.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_question_model.dart';
part 'learn_path_quiz_model.g.dart'; // قم بإضافة هذا الجزء
@HiveType(typeId: 4)
class LearnPathQuizModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final List<LearningPathQuestionModel> questions;

  const LearnPathQuizModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.isCompleted,
    required this.questions,
  });

  factory LearnPathQuizModel.fromJson(Map<String, dynamic> json) {
    return LearnPathQuizModel(
      id: json['id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      isCompleted: json['isCompleted'],
      questions:
          (json['questions'] as List)
              .map((e) => LearningPathQuestionModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'isCompleted': isCompleted,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}
