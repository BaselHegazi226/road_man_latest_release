import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../_05_main_view/presentation/view/widgets/main_view_common_widgets/home_const_list.dart';
import 'job_view_dashboard_item.dart';

class JobViewDashboardItemsSection extends StatelessWidget {
  const JobViewDashboardItemsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: HomeConstList.dashboardItemModelList.length,
      itemBuilder: (context, index) {
        final item = HomeConstList.dashboardItemModelList[index];
        return JobViewDashboardItem(
          customDrawerItemModel: item,
          onTap:
              item.routeName.isNotEmpty
                  ? () => GoRouter.of(context).push(item.routeName)
                  : null,
        );
      },
    );
  }
}
