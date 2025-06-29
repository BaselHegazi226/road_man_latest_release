// questionnaire_response_model.dart
class QuestionnaireResponseModel {
  final int questionId;
  final List<int> answerIds;

  const QuestionnaireResponseModel({
    required this.questionId,
    required this.answerIds,
  });

  Map<String, dynamic> toJson() {
    return {'questionId': questionId, 'answerIds': answerIds};
  }
}
