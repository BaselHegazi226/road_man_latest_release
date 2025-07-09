import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo_implement.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/00_home_view_widgets/home_view_app_bar.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/00_home_view_widgets/home_view_body.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/progress_cubit/progress_cubit.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';

import '../../../../core/utilities/app_get.dart';
import '../../../_09_profile_view/data/repos/profile_repos/profile_repos_implementation.dart';
import '../../../_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import '../view_model/notifications/notification_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      resizeToAvoidBottomInset: true,
      appBar: homeViewAppbar(context),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: AppGet.getIt<RecommendedJobsCubit>()..fetchRecommendedJobs(),
          ),
          BlocProvider.value(
            value: AppGet.getIt<ProgressCubit>()..fetchProgress(),
          ),
          BlocProvider(
            create:
                (context) =>
                    NotificationCubit(HomeRepoImplement())
                      ..fetchAllNotification(),
          ),
          BlocProvider(
            create:
                (context) => GetUserInfoCubit(
                  profileRepos: ProfileReposImplementation(),
                ),
          ),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
