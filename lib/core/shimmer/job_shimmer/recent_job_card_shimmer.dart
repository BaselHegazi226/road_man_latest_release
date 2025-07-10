import 'package:flutter/material.dart';
import 'package:road_man_project/core/shimmer/job_shimmer/recent_job_card_item_shimmer.dart';

class RecentJobsCardShimmer extends StatelessWidget {
  const RecentJobsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,

      itemBuilder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.01),
          child: RecentJobsCardShimmerItem(),
        );
      },
    );
  }
}
