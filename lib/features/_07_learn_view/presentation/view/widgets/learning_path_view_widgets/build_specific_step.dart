import 'package:flutter/material.dart';

import '../../../../../../generated/Assets.dart';
import 'learning_path_step.dart';

class LessonStep extends StatelessWidget {
  const LessonStep({
    super.key,
    required this.alignment,
    required this.onPressed,
    required this.horizontalOffset,
    required this.image,
    required this.backgroundColor,

    required this.shadowColor,
  });
  final Alignment alignment;
  final VoidCallback? onPressed;
  final double horizontalOffset;
  final String image;
  final Color backgroundColor, shadowColor;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * .025,
          bottom: screenSize.height * .01,
          left: alignment == Alignment.centerLeft ? horizontalOffset : 0,
          right: alignment == Alignment.centerRight ? horizontalOffset : 0,
        ),
        child: LevelStep(
          onPressed: onPressed,
          image: image,

          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
        ),
      ),
    );
  }

  Map<String, dynamic> allDataOfStep({
    required int stepType, // 0: Star, 1: Lesson, 2: Quiz
    required int progressStatus,
  }) {
    switch (stepType) {
      case 0: // ⭐ Star
        if (progressStatus == 100) {
          return {
            'background_color': const Color(0xff9EDA53), // أخضر
            'shadow_color': const Color(0xff69A123),
            'icon_color': Colors.yellow,
            'image': Assets.learningPathFinishedStarImage,
          };
        } else if (progressStatus > 0) {
          return {
            'background_color': const Color(0xff5385DA), // أزرق
            'shadow_color': const Color(0xff2961BE),
            'icon_color': Colors.white,
            'image': Assets.learningPathFinishedStarImage,
          };
        } else {
          return {
            'background_color': const Color(0xffE5E5E5), // رمادي فاتح
            'shadow_color': const Color(0xffB7B7B7),
            'icon_color': Colors.grey,
            'image': Assets.learningPathFinishedStarImage,
          };
        }

      case 1: // 📘 Lesson
        if (progressStatus > 0) {
          return {
            'background_color': const Color(0xff5385DA),
            'shadow_color': const Color(0xff2961BE),
            'icon_color': Colors.white,
            'image': Assets.learningPathUnActiveLessonImage,
          };
        } else {
          return {
            'background_color': const Color(0xffE5E5E5),
            'shadow_color': const Color(0xffB7B7B7),
            'icon_color': Colors.white,
            'image': Assets.learningPathUnActiveLessonImage,
          };
        }

      case 2: // 🧪 Quiz
        if (progressStatus == 100) {
          return {
            'background_color': const Color(0xff5385DA),
            'shadow_color': const Color(0xff2961BE),
            'icon_color': Colors.white,
            'image': Assets.logoRImage,
          };
        } else {
          return {
            'background_color': const Color(0xffE5E5E5),
            'shadow_color': const Color(0xffB7B7B7),
            'icon_color': Colors.white,
            'image': Assets.logoRImage,
          };
        }

      default:
        return {};
    }
  }
}

class QuizStep extends StatelessWidget {
  const QuizStep({
    super.key,
    required this.alignment,
    required this.onPressed,
    required this.horizontalOffset,
    required this.image,
    required this.backgroundColor,
    required this.iconColor,
    required this.shadowColor,
  });
  final Alignment alignment;
  final VoidCallback? onPressed;
  final double horizontalOffset;
  final String image;
  final Color backgroundColor, iconColor, shadowColor;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * .025,
          bottom: screenSize.height * .01,
          left: alignment == Alignment.centerLeft ? horizontalOffset : 0,
          right: alignment == Alignment.centerRight ? horizontalOffset : 0,
        ),
        child: LevelStep(
          onPressed: onPressed,
          image: image,
          backgroundColor: backgroundColor,
          shadowColor: shadowColor,
        ),
      ),
    );
  }
}
