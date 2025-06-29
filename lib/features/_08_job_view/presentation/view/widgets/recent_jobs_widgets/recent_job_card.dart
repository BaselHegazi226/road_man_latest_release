import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card_title_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_jobs_card_price_section.dart';

class RecentJobsCard extends StatelessWidget {
  final JobViewCardModel recentJobsCardModel;
  const RecentJobsCard({super.key, required this.recentJobsCardModel});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).push(Routes.jobDetailsViewId, extra: recentJobsCardModel);
      },
      child: Container(
        height: screenHeight * 0.16,
        padding: EdgeInsets.all(screenWidth * 0.02), // Padding متجاوب
        decoration: BoxDecoration(
          color: kSecondlyDarkWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: screenHeight * 0.008,
              children: [
                RecentJobCardTitleSection(
                  title: recentJobsCardModel.title,
                  recentJobsCardModel: recentJobsCardModel,
                ),
                RecentJobsCardPriceSection(
                  salary: recentJobsCardModel.salary,
                  jobType: recentJobsCardModel.jobType,
                ),
              ],
            ),
            RecentJobCardLocationSection(
              company: recentJobsCardModel.company,
              location: recentJobsCardModel.location,
              timeLeft: recentJobsCardModel.timeLeft!,
            ),
          ],
        ),
      ),
    );
  }
}
