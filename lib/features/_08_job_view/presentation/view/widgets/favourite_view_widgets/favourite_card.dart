import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/favourite_view_widgets/favourite_card_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/favourite_view_widgets/favourite_card_salary_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/favourite_view_widgets/favourite_card_title_section.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key, required this.recentJobsCardItemModel});
  final JobViewCardModel? recentJobsCardItemModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .15,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      decoration: BoxDecoration(
        color: const Color(0xffE6E8EE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: MediaQuery.sizeOf(context).height * .01,
            children: [
              FavouriteCardTitleSection(title: recentJobsCardItemModel!.title),
              FavouriteCardSalarySection(
                salary: recentJobsCardItemModel!.salary,
                jobType: recentJobsCardItemModel!.jobType,
              ),
            ],
          ),
          FavouriteCardLocationSection(
            company: recentJobsCardItemModel!.company,
            location: recentJobsCardItemModel!.location,
            timeLeft: recentJobsCardItemModel!.timeLeft ?? 'suggested',
          ),
        ],
      ),
    );
  }
}
