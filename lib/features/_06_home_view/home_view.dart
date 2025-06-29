import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/progress_repo_implement.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/home_view_body.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/progress_cubit/progress_cubit.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';

import 'data/repos/home_repo_implement.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    ProgressCubit(ProgressRepoImplement())..fetchProgress(),
          ),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
