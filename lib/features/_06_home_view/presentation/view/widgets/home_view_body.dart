import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/recommended_jobs_section.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/welcome_section.dart';

import 'current_path_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: screenSize.height * .03,
          children: [
            SizedBox(height: screenSize.height * .04), // Space for top header
            const WelcomeSection(),
            const CurrentPathCard(),
            const ProgressSection(),
            const RecommendedJobsSection(),
            SizedBox(
              height: screenSize.height * .02,
            ), // Space for bottom header
          ],
        ),
      ),
    );
  }
}
