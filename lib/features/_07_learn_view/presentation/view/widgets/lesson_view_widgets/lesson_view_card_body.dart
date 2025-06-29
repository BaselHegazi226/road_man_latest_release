// ✅ LessonViewCardBody.dart
import 'package:flutter/material.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'lesson_view_card_component_section.dart';

class LessonViewCardBody extends StatelessWidget {
  const LessonViewCardBody({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.learnPathLessonModel,
    required this.onPressed,
    required this.isCompleted,
    required this.isCurrent,
  });

  final double screenHeight;
  final double screenWidth;
  final LearnPathLessonModel learnPathLessonModel;
  final VoidCallback? onPressed;
  final bool isCompleted;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;

    if (isCompleted) {
      icon = Icons.check_circle_outline;
      iconColor = kAppPrimaryBlueColor;
    } else if (isCurrent) {
      icon = Icons.play_circle_fill_outlined;
      iconColor = kAppPrimaryBlueColor;
    } else {
      icon = Icons.lock_outline;
      iconColor = kAppPrimaryBlackColor;
    }

    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LessonViewCardComponentSection(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            lessonNumber: learnPathLessonModel.lessonNumber,
            lessonTitle: learnPathLessonModel.title,
            lessonTime: learnPathLessonModel.estimatedDuration,
          ),
          Icon(icon, color: iconColor, size: screenWidth * .06),
        ],
      ),
    );
  }
}
