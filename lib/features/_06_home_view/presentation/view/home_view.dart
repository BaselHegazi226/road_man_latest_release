import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/00_home_view_widgets/home_view_app_bar.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/00_home_view_widgets/home_view_body.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/progress_cubit/progress_cubit.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';

import '../../../../core/utilities/app_get.dart';
import '../../../_09_profile_view/data/repos/profile_repos/profile_repos_implementation.dart';
import '../../../_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import '../view_model/notifications/notifications_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder:
              (context) => homeViewAppbar(
                context,
              ), // ده مهم جداً علشان ياخد context جديد تحت الـ BlocProvider
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: AppGet.getIt<RecommendedJobsCubit>()..fetchRecommendedJobs(),
          ),
          BlocProvider.value(
            value: AppGet.getIt<ProgressCubit>()..fetchProgress(),
          ),
          BlocProvider.value(
            value: AppGet.getIt<NotificationsCubit>()..fetchAllNotification(),
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
