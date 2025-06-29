import 'package:hive/hive.dart';

import 'learn_path_answer_model.dart';

part 'learning_path_question_model.g.dart';

@HiveType(typeId: 6)
class LearningPathQuestionModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final List<LearnPathAnswerModel> answers;

  const LearningPathQuestionModel({
    required this.id,
    required this.text,
    required this.answers,
  });

  factory LearningPathQuestionModel.fromJson(Map<String, dynamic> json) {
    return LearningPathQuestionModel(
      id: json['id'],
      text: json['text'],
      answers:
          (json['answers'] as List)
              .map((e) => LearnPathAnswerModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }
}
