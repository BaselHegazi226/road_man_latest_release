import 'package:hive/hive.dart';
part 'learn_path_quiz_view_card_model.g.dart'; // قم بإضافة هذا الجزء
@HiveType(typeId: 8)
class QuizViewCardAnswer {
  @HiveField(0)
  final int answerId;

  @HiveField(1)
  final String answerText;

  @HiveField(2)
  final bool isCorrect;

  const QuizViewCardAnswer({
    required this.answerId,
    required this.answerText,
    required this.isCorrect,
  });
}
