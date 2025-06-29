import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_home_view/data/model/progress_model.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/progress_items.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/start_learning_button.dart';

class LeftSection extends StatelessWidget {
  final ProgressModel progress;
  const LeftSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ProgressItems(progress: progress), const StartLearningButton()],
    );
  }
}
