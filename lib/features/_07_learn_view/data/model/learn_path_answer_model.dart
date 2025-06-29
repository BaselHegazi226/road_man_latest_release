import 'package:hive/hive.dart';
part 'learn_path_answer_model.g.dart'; // قم بإضافة هذا الجزء
@HiveType(typeId: 1)
class LearnPathAnswerModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? text; // Nullable

  @HiveField(2)
  final bool isCorrect;

  const LearnPathAnswerModel({
    required this.id,
    required this.text,
    required this.isCorrect,
  });

  factory LearnPathAnswerModel.fromJson(Map<String, dynamic> json) {
    return LearnPathAnswerModel(
      id: json['id'],
      text: json['text'],
      isCorrect: json['isCorrect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'isCorrect': isCorrect};
  }
}
