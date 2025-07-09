import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/app_get.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_widgets/job_view_body.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view_model/recent_jobs/recent_jobs_cubit.dart';

import '../../../_06_home_view/presentation/view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      resizeToAvoidBottomInset: true,
      appBar: customTitleAppbar(context, text: 'Jobs'),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: AppGet.getIt<RecommendedJobsCubit>()..fetchRecommendedJobs(),
          ),
          BlocProvider.value(
            value: AppGet.getIt<RecentJobsCubit>()..fetchRecentJobs(),
          ),
        ],
        child: Builder(
          // 👈 نستخدم Builder لضمان الوصول إلى BlocProviders
          builder: (context) {
            return Column(children: [const Expanded(child: JobViewBody())]);
          },
        ),
      ),
    );
  }
}
