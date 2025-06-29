import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class LessonViewCardComponentSection extends StatelessWidget {
  const LessonViewCardComponentSection({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.lessonNumber,
    required this.lessonTitle,
    required this.lessonTime,
  });
  final double screenHeight, screenWidth;
  final int lessonNumber, lessonTime;
  final String lessonTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: screenHeight * .025,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Lesson 0$lessonNumber',
          style: JostTextStyles.textStyle15W600Black(context),
        ),
        SizedBox(
          width:
              screenWidth *
              .7, // أو استخدم screenWidth * 0.4 مثلًا لو تحب مرونة
          child: Text(
            lessonTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: JostTextStyles.textStyle15W600Blue(context),
          ),
        ),
        Text(
          '$lessonTime mins',
          style: AfacadTextStyles.textStyle15W500Grey(context),
        ),
      ],
    );
  }
}
