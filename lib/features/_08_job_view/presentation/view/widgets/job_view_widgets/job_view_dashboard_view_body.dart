import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../../../../../_05_main_view/presentation/view/widgets/custom_dashboard_widgets/custom_dashboard_icon_title.dart';
import '../../../../../_09_profile_view/presentation/view/widgets/00_profile_common_widgets/profile_user_info.dart';
import 'job_view_dashboard_items_section.dart';

class JobViewDashboardViewBody extends StatelessWidget {
  const JobViewDashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * .04,
        right: screenWidth * .04,
        top: screenHeight * .02,
        bottom: screenHeight * .04,
      ),
      child: Column(
        spacing: screenHeight * .01,
        children: [
          ProfileUserInfo(name: 'name', email: 'email@gmail.com', photo: ''),
          Divider(thickness: .5, color: kLogoutLineColor),
          const JobViewDashboardItemsSection(),
          const Spacer(),
          Divider(thickness: .5, color: kLogoutLineColor),
          CustomDashboardIconTitle(
            iconData: Icons.logout,
            iconColor: Colors.red,
            title: 'Log out',
            textColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
