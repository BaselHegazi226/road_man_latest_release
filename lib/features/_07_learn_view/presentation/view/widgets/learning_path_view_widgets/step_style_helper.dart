import 'package:flutter/material.dart';

import '../../../../../../generated/Assets.dart';

enum StepType { star, lesson, quiz }

class StepStyleHelper {
  static Map<String, dynamic> getStepStyle({
    required StepType stepType,
    required int? progressStatus,
  }) {
    switch (stepType) {
      case StepType.star:
        if (progressStatus == null || progressStatus == 0) {
          return {
            'background_color': const Color(0xffE5E5E5),
            'shadow_color': const Color(0xffB7B7B7),
            'image': Assets.learningPathUnActiveStarImage,
          };
        } else {
          if (progressStatus == 100) {
            return {
              'background_color': const Color(0xff9EDA53),
              'shadow_color': const Color(0xff69A123),
              'image': Assets.learningPathFinishedStarImage,
            };
          } else {
            return {
              'background_color': const Color(0xff5385DA),
              'shadow_color': const Color(0xff2961BE),
              'image': Assets.learningPathActiveStarImage,
            };
          }
        }

      case StepType.lesson:
        if (progressStatus == null || progressStatus == 0) {
          return {
            'background_color': const Color(0xffE5E5E5),
            'shadow_color': const Color(0xffB7B7B7),
            'image': Assets.learningPathUnActiveLessonImage,
          };
        } else {
          return {
            'background_color': const Color(0xff5385DA),
            'shadow_color': const Color(0xff2961BE),
            'image': Assets.learningPathActiveLessonImage,
          };
        }

      case StepType.quiz:
        if (progressStatus == null || progressStatus == 0) {
          return {
            'background_color': const Color(0xffE5E5E5),
            'shadow_color': const Color(0xffB7B7B7),
            'image': Assets.learningPathUnActiveQuizImage,
          };
        } else {
          return {
            'background_color': const Color(0xff5385DA),
            'shadow_color': const Color(0xff2961BE),
            'image': Assets.learningPathActiveQuizImage,
          };
        }
    }
  }
}
