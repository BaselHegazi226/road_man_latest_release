import 'package:flutter/foundation.dart';

/// A model class that represents a user's progress.
///
/// This class is immutable, meaning its properties cannot be changed after creation.
@immutable
class ProgressModel {
  final int totalLevels;
  final int completedLevels;
  final int totalLessons;
  final int completedLessons;
  final int totalQuizzes;
  final int completedQuizzes;
  final int totalProgress;

  /// Creates a new instance of the progress model.
  const ProgressModel({
    required this.totalLevels,
    required this.completedLevels,
    required this.totalLessons,
    required this.completedLessons,
    required this.totalQuizzes,
    required this.completedQuizzes,
    required this.totalProgress,
  });

  /// Creates a [ProgressModel] instance from a JSON map.
  ///
  /// This factory constructor is used for deserialization (converting JSON to a Dart object).
  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    return ProgressModel(
      totalLevels: json['totalLevels'] as int? ?? 0,
      completedLevels: json['completedLevels'] as int? ?? 0,
      totalLessons: json['totalLessons'] as int? ?? 0,
      completedLessons: json['completedLessons'] as int? ?? 0,
      totalQuizzes: json['totalQuizzes'] as int? ?? 0,
      completedQuizzes: json['completedQuizzes'] as int? ?? 0,
      totalProgress: json['totalProgress'] as int? ?? 0,
    );
  }

  /// Converts the [ProgressModel] instance to a JSON map.
  ///
  /// This method is used for serialization (converting a Dart object to JSON).
  Map<String, dynamic> toJson() {
    return {
      'totalLevels': totalLevels,
      'completedLevels': completedLevels,
      'totalLessons': totalLessons,
      'completedLessons': completedLessons,
      'totalQuizzes': totalQuizzes,
      'completedQuizzes': completedQuizzes,
      'totalProgress': totalProgress,
    };
  }

  @override
  String toString() {
    return 'ProgressModel(totalLevels: $totalLevels, completedLevels: $completedLevels, totalLessons: $totalLessons, completedLessons: $completedLessons, totalQuizzes: $totalQuizzes, completedQuizzes: $completedQuizzes, totalProgress: $totalProgress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProgressModel &&
        other.totalLevels == totalLevels &&
        other.completedLevels == completedLevels &&
        other.totalLessons == totalLessons &&
        other.completedLessons == completedLessons &&
        other.totalQuizzes == totalQuizzes &&
        other.completedQuizzes == completedQuizzes &&
        other.totalProgress == totalProgress;
  }

  @override
  int get hashCode {
    return Object.hash(
      totalLevels,
      completedLevels,
      totalLessons,
      completedLessons,
      totalQuizzes,
      completedQuizzes,
      totalProgress,
    );
  }
}