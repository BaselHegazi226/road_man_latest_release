import 'learn_path_model.dart';

class LearningPathResponse {
  final List<LearnPathModel> learningPath;

  const LearningPathResponse({required this.learningPath});

  // Factory method to create a LearningPathResponse from JSON
  factory LearningPathResponse.fromJson(Map<String, dynamic> json) {
    return LearningPathResponse(
      learningPath:
          (json['learningPath'] as List)
              .map((e) => LearnPathModel.fromJson(e))
              .toList(),
    );
  }

  // Convert LearningPathResponse to JSON
  Map<String, dynamic> toJson() {
    return {'learningPath': learningPath.map((lp) => lp.toJson()).toList()};
  }
}
