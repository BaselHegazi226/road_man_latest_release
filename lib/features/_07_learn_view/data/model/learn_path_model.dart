import 'package:hive/hive.dart';

import 'learn_path_lesson_model.dart';
import 'learn_path_quiz_model.dart';

part 'learn_path_model.g.dart'; // قم بإضافة هذا الجزء

@HiveType(typeId: 3)
class LearnPathModel {
  @HiveField(0)
  final int levelNumber;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final int progressStatus;

  @HiveField(3)
  final int trackResourceId;

  @HiveField(4)
  final String url;

  @HiveField(5)
  final String title;

  @HiveField(6)
  final String level;

  @HiveField(7)
  final String language;

  @HiveField(8)
  final String typeOfContent;

  @HiveField(9)
  final int estimatedDuration;

  @HiveField(10)
  final List<LearnPathLessonModel> lessons;

  @HiveField(11)
  final LearnPathQuizModel quiz;

  const LearnPathModel({
    required this.levelNumber,
    required this.id,
    required this.progressStatus,
    required this.trackResourceId,
    required this.url,
    required this.title,
    required this.level,
    required this.language,
    required this.typeOfContent,
    required this.estimatedDuration,
    required this.lessons,
    required this.quiz,
  });

  factory LearnPathModel.fromJson(Map<String, dynamic> json) {
    return LearnPathModel(
      levelNumber: json['levelNumber'],
      id: json['id'],
      progressStatus: json['progressStatus'],
      trackResourceId: json['trackResourceId'],
      url: json['url'],
      title: json['title'],
      level: json['level'],
      language: json['language'],
      typeOfContent: json['typeOfContent'],
      estimatedDuration:
          json['estimatedDuration'] is String
              ? int.tryParse(json['estimatedDuration']) ?? 0
              : (json['estimatedDuration'] as num).toInt(),
      lessons:
          (json['lessons'] as List)
              .map((e) => LearnPathLessonModel.fromJson(e))
              .toList(),
      quiz: LearnPathQuizModel.fromJson(json['quiz']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'levelNumber': levelNumber,
      'id': id,
      'progressStatus': progressStatus,
      'trackResourceId': trackResourceId,
      'url': url,
      'title': title,
      'level': level,
      'language': language,
      'typeOfContent': typeOfContent,
      'estimatedDuration': estimatedDuration,
      'lessons': lessons.map((lesson) => lesson.toJson()).toList(),
      'quiz': quiz.toJson(),
    };
  }
}
