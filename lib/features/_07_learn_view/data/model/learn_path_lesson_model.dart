import 'package:hive/hive.dart';

part 'learn_path_lesson_model.g.dart';

@HiveType(typeId: 2)
class LearnPathLessonModel {
  @HiveField(0)
  final int lessonNumber;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String url;

  @HiveField(4)
  final int estimatedDuration;

  const LearnPathLessonModel({
    required this.lessonNumber,
    required this.id,
    required this.title,
    required this.url,
    required this.estimatedDuration,
  });

  factory LearnPathLessonModel.fromJson(Map<String, dynamic> json) {
    return LearnPathLessonModel(
      lessonNumber: json['lessonNumber'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      estimatedDuration:
          json['estimatedDuration'] is String
              ? int.tryParse(json['estimatedDuration']) ?? 0
              : (json['estimatedDuration'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lessonNumber': lessonNumber,
      'id': id,
      'title': title,
      'url': url,
      'estimatedDuration': estimatedDuration,
    };
  }

  LearnPathLessonModel copyWith({
    int? lessonNumber,
    int? id,
    String? title,
    String? url,
    int? estimatedDuration,
    bool? isCompleted,
  }) {
    return LearnPathLessonModel(
      lessonNumber: lessonNumber ?? this.lessonNumber,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
    );
  }
}
