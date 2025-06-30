import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_widgets/job_view_app_bar.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_widgets/job_view_body.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view_model/recent_jobs/recent_jobs_cubit.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos_implementation.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';

import '../../../_06_home_view/data/repos/home_repo_implement.dart';
import '../../../_06_home_view/presentation/view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';
import '../../data/repos/jobs_repo_implement.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      resizeToAvoidBottomInset: true,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    RecommendedJobsCubit(HomeRepoImplement())
                      ..fetchRecommendedJobs(),
          ),
          BlocProvider(
            create:
                (context) =>
                    RecentJobsCubit(JobsRepoImplement())..fetchRecentJobs(),
          ),
          BlocProvider(
            create:
                (context) =>
                    NotificationCubit(JobsRepoImplement())
                      ..fetchAllNotification(),
          ),
          BlocProvider(
            create:
                (context) => GetUserInfoCubit(
                  profileRepos: ProfileReposImplementation(),
                ),
          ),
        ],
        child: Builder(
          // 👈 نستخدم Builder لضمان الوصول إلى BlocProviders
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * .02,
                    right: screenWidth * .02,
                    top: screenHeight * .02,
                  ),
                  child: jobViewAppbar(context),
                ),
                const Expanded(child: JobViewBody()),
              ],
            );
          },
        ),
      ),
    );
  }
}
