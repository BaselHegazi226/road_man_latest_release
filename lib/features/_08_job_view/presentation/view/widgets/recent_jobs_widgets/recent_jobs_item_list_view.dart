import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_jobs_item.dart';

class RecentJobsItemListView extends StatelessWidget {
  const RecentJobsItemListView({super.key});

  static const List<String> textList = [
    'All',
    'Design',
    'Development',
    'Marketing & Content Creator',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.043, // ارتفاع متناسب مع حجم الشاشة
      child: ListView.builder(
        itemCount: textList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.04), // تباعد نسبي
            child: RecentJobsItem(text: textList[index]),
          );
        },
      ),
    );
  }
}
