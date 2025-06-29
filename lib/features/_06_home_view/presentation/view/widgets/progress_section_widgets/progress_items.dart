import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_home_view/data/model/progress_model.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/progress_item.dart';

class ProgressItems extends StatelessWidget {
  final ProgressModel progress;
  const ProgressItems({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProgressItem(
          title: 'Completed Levels',
          value: '${progress.completedLevels}/${progress.totalLevels}',
          image: 'assets/images/home/metabolism.svg',
        ),
        const SizedBox(height: 4),
        ProgressItem(
          title: 'Completed Lessons',
          value: '${progress.completedLessons}/${progress.totalLessons}',
          image: 'assets/images/home/hourglass_arrow_down.svg',
        ),
        const SizedBox(height: 4),
        ProgressItem(
          title: 'Completed Tests',
          value: '${progress.completedQuizzes}/${progress.totalQuizzes}',
          image: 'assets/images/home/summarize.svg',
        ),
      ],
    );
  }
}
