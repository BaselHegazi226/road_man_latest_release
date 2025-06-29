import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_widgets/job_view_dashboard_view_body.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';
import '../../../../../_05_main_view/presentation/view/widgets/custom_dashboard_widgets/open_dashboard.dart';

AppBar jobDetailsAppbar(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;

  return AppBar(
    backgroundColor: kAppPrimaryBlueColor,
    leading: IconButton(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
      ), // نسبة 4% من العرض
      onPressed: () {
        GoRouter.of(context).pop();
      },
      icon: Icon(
        CupertinoIcons.back,
        color: kSecondlyLightWhiteColor,
        size: screenWidth * 0.06,
      ),
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
        ), // نسبة 4% من العرض
        onPressed: () {
          openDashboard(context, const JobViewDashboardViewBody());
        },
        icon: Icon(
          Icons.menu_outlined,
          color: kSecondlyLightWhiteColor,
          size: screenWidth * 0.06,
        ),
      ),
    ],
    title: Text(
      'Job Details',
      style: AfacadTextStyles.textStyle20W500Blue(context).copyWith(
        color: kSecondlyLightWhiteColor,
        fontSize: screenWidth * 0.05,
      ), // جعل النص ديناميكي
    ),
    centerTitle: true,
  );
}
