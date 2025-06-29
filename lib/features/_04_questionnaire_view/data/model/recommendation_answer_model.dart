class RecommendationAnswer {
  final int questionId;
  final List<int> answerIds;

  RecommendationAnswer({required this.questionId, required this.answerIds});

  Map<String, dynamic> toJson() {
    return {'questionId': questionId, 'answerIds': answerIds};
  }
}
