import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/suggested_jobs_price_subscription_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/suggested_jobs_track_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/working_time_item_section.dart';

class SuggestedJobsCard extends StatelessWidget {
  const SuggestedJobsCard({super.key, required this.suggestedJobsItemModel});
  final JobViewCardModel suggestedJobsItemModel;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).push(Routes.jobDetailsViewId, extra: suggestedJobsItemModel);
      },
      child: Container(
        width: screenWidth * 0.85,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.017,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffE6E8EE),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SuggestedJobsTrackLocationSection(
                title: suggestedJobsItemModel.title,
                company: suggestedJobsItemModel.company,
                location: suggestedJobsItemModel.location,
                image: suggestedJobsItemModel.logo,
                suggestedJobsItemModel: suggestedJobsItemModel,
              ),
              SizedBox(height: screenHeight * 0.01),
              SuggestedJobsPriceSubscriptionSection(
                price: suggestedJobsItemModel.salary,
                subscriptionType: suggestedJobsItemModel.salaryType,
              ),
              SizedBox(height: screenHeight * 0.01),
              WorkingTimeSection(
                jobType: suggestedJobsItemModel.jobType,
                jobLevel: suggestedJobsItemModel.jobLevel!,
                onPressed: () {
                  GoRouter.of(context).push(
                    Routes.jobDetailsViewId,
                    extra: suggestedJobsItemModel,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
