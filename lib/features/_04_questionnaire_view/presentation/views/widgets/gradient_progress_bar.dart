import 'package:flutter/material.dart';

import '../../../../../core/utilities/gradients.dart';

class GradientProgressBar extends StatelessWidget {
  final double progress; // Value between 0.0 and 1.0 (0% to 100%)
  final double height;
  final BorderRadius borderRadius;

  const GradientProgressBar({
    super.key,
    required this.progress,
    this.height = 10.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          Container(height: height, color: Color(0xFFE6E8EE)),
          FractionallySizedBox(
            widthFactor: clampedProgress,
            child: Container(
              height: height,
              decoration: BoxDecoration(gradient: Gradients.blueLinearGradient),
            ),
          ),
        ],
      ),
    );
  }
}
