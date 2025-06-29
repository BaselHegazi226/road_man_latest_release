import 'package:flutter/material.dart';

import '../recent_jobs_widgets/recent_jobs_section.dart';
import '../search_bar_widgets/job_view_search_bar_section.dart';
import '../suggested_jobs_widgets/suggested_jobs_card_section.dart';

class JobViewBody extends StatelessWidget {
  const JobViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: screenHeight * 0.025, // تباعد ديناميكي بين العناصر
        children: [
          const JobViewSearchBarSection(),
          const SuggestedJobsCardSection(),
          const RecentJobsSection(),
        ],
      ),
    );
  }
}
