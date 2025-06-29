import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_home_view/data/model/progress_model.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class ProgressCircle extends StatelessWidget {
  final int totalProgress;
  const ProgressCircle({super.key, required this.totalProgress});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final circleSize = screenSize.width * 0.248;

    final double progressValue = totalProgress / 100.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Background circle with gradient
        Container(
          width: circleSize,
          height: circleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment(0.50, 1.00),
              end: Alignment(0.50, 0.00),
              colors: [Color(0xFF052C6E), Color(0xFF3D76D5)],
            ),
          ),
        ),

        // 2. Percentage text, now driven by the model
        Text(
          '$totalProgress%', // Dynamic text from the model
          style: AfacadTextStyles.textStyle20W600Black(context),
        ),

        // 3. CircularProgressIndicator, now driven by the model
        SizedBox(
          width: circleSize,
          height: circleSize,
          child: CircularProgressIndicator(
            value: progressValue, // Dynamic value from the model
            strokeWidth: 7.0,
            // Changed colors for better visibility on the dark gradient
            backgroundColor: Colors.white.withOpacity(0.2), // A transparent track
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ],
    );
  }
}