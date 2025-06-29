import 'package:hive/hive.dart';

part 'learn_path_user_answer_model.g.dart'; // قم بإضافة هذا الجزء

@HiveType(typeId: 5)
class LearnPathUserAnswerModel {
  @HiveField(0)
  final String userAnswerId;

  @HiveField(1)
  final int questionId;

  @HiveField(2)
  final int quizId;

  @HiveField(3)
  final int answerId;

  @HiveField(4)
  final bool isCorrect;

  const LearnPathUserAnswerModel({
    required this.userAnswerId,
    required this.questionId,
    required this.quizId,
    required this.answerId,
    required this.isCorrect,
  });

  factory LearnPathUserAnswerModel.fromJson(Map<String, dynamic> json) {
    return LearnPathUserAnswerModel(
      userAnswerId: json['id'],
      questionId: json['questionId'],
      quizId: json['quizId'],
      answerId: json['answerId'],
      isCorrect: json['isCorrect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userAnswerId,
      'questionId': questionId,
      'quizId': quizId,
      'answerId': answerId,
      'isCorrect': isCorrect,
    };
  }
}
