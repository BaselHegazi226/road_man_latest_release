import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/common_widgets/job_view_const_list.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_jobs_card_list_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_jobs_item_list_view.dart';

import '../job_view_widgets/two_title.dart';

class RecentJobsSection extends StatelessWidget {
  const RecentJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double spacingValue = screenHeight * 0.009; // نفس النسبة المستخدمة

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacingValue, // نفس منطق التباعد
        children: [
          TwoTitle(
            title1: 'Recent Jobs',
            title2: 'View all',
            title2onPressed: () {},
          ),
          RecentJobsItemListView(),
          RecentJobsCardListView(
            recentJobsCardItemModelList:
                JobViewConstList.recentJobsCardItemModelList,
          ),
        ],
      ),
    );
  }
}
