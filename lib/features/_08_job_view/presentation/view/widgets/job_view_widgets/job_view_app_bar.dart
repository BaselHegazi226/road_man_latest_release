import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../_05_main_view/presentation/view/widgets/custom_dashboard_widgets/open_dashboard.dart';
import '../../../../../_09_profile_view/data/repos/profile_repos/profile_repos_implementation.dart';
import '../../../../../_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import '../../../view_model/recent_jobs/recent_jobs_cubit.dart';
import 'job_view_dashboard_view_body.dart';

AppBar jobViewAppbar(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final iconSize = screenWidth * 0.07; // حجم الأيقونة متناسب مع العرض

  return AppBar(
    backgroundColor: kAppPrimaryWhiteColor,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      icon: Icon(
        Icons.menu_outlined,
        color: kEditProfileIconColor,
        size: iconSize, // حجم الأيقونة ديناميكي
      ),
      onPressed: () {
        final dashboardBody = BlocProvider<GetUserInfoCubit>(
          create:
              (_) =>
                  GetUserInfoCubit(profileRepos: ProfileReposImplementation()),
          child: const JobViewDashboardViewBody(),
        );

        openDashboard(context, dashboardBody);
      },
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
        icon: Icon(
          Icons.notifications_outlined,
          color: kTextBlackPrimaryColor,
          size: iconSize, // حجم الأيقونة ديناميكي
        ),
        onPressed: () {
          //trigger notification data
          context.read<NotificationCubit>().fetchAllNotification();
          GoRouter.of(context).push(Routes.notificationJobViewId);
        },
      ),
    ],
  );
}
