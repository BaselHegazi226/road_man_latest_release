import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../_05_main_view/presentation/view/widgets/custom_dashboard_widgets/open_dashboard.dart';
import '../../../../../_08_job_view/presentation/view/widgets/job_view_widgets/job_view_dashboard_view_body.dart';
import '../../../../../_09_profile_view/data/repos/profile_repos/profile_repos_implementation.dart';
import '../../../../../_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import '../../../view_model/notifications/notification_cubit.dart';

AppBar homeViewAppbar(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  //final iconSize = screenWidth * 0.07; // حجم الأيقونة متناسب مع العرض

  return AppBar(
    backgroundColor: kAppPrimaryWhiteColor,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.only(
        left: screenSize.width * 0.02,
        right: screenSize.width * 0.02,
        top: screenSize.height * .01,
      ),
      icon: Icon(
        Icons.menu_outlined,
        color: kEditProfileIconColor,
        size: 32, // حجم الأيقونة ديناميكي
      ),
      onPressed: () {
        final dashboardBody = BlocProvider<GetUserInfoCubit>(
          create:
              (_) =>
                  GetUserInfoCubit(profileRepos: ProfileReposImplementation()),
          child: const HomeViewDashboardViewBody(),
        );

        openDashboard(context, dashboardBody);
      },
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.only(
          left: screenSize.width * 0.02,
          right: screenSize.width * 0.02,
          top: screenSize.height * .01,
        ),
        icon: Icon(
          Icons.notifications_outlined,
          color: kTextBlackPrimaryColor,
          size: 32, // حجم الأيقونة ديناميكي
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
