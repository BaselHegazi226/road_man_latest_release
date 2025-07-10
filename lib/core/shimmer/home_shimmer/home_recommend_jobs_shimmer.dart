import 'package:flutter/material.dart';
import 'package:road_man_project/core/shimmer/home_shimmer/home_recommend_jobs_item_shimmer.dart';

class HomeRecommendedJobsShimmer extends StatelessWidget {
  const HomeRecommendedJobsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: screenSize.width * .05),
          child: HomeRecommendedJobsItemShimmer(),
        );
      },
    );
  }
}
