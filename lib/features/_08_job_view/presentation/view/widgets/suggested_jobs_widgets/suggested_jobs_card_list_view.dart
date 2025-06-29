import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/suggested_jobs_card.dart';

import '../../../../../_06_home_view/presentation/view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';

class SuggestedJobsCardListView extends StatelessWidget {
  const SuggestedJobsCardListView({
    super.key,
    required this.suggestedJobsItemModelList,
  });

  final List<JobViewCardModel> suggestedJobsItemModelList;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.2, // ارتفاع متناسق مع الشاشة
      child: BlocBuilder<RecommendedJobsCubit, RecommendedJobsState>(
        builder: (context, state) {
          // 1. في حالة التحميل أو الحالة المبدئية
          if (state is RecommendedJobsLoading || state is RecommendedJobsInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          // 2. في حالة النجاح
          else if (state is RecommendedJobsSuccess) {
            // التحقق إذا كانت قائمة الوظائف فارغة
            if (state.jobs.isEmpty) {
              return const Center(child: Text('No recommended jobs found.'));
            }
            return ListView.builder(
              itemCount: state.jobs.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final job = state.jobs[index];
                return Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth * 0.04,
                  ), // تباعد ديناميكي
                  child: SuggestedJobsCard(
                    suggestedJobsItemModel: JobViewCardModel(title: '${job.title}',
                        company: '${job.company}',
                        location: '${job.location}',
                        logo: suggestedJobsItemModelList[0].logo,
                        salary: '${job.salary}',
                        salaryType: suggestedJobsItemModelList[0].salaryType,
                        jobType: job.jobType ?? '',
                        jobLevel: suggestedJobsItemModelList[0].jobLevel),
                  ),
                );
              },
            );
          }
          // 3. في حالة الفشل
          else if (state is RecommendedJobsFailure) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          // لأي حالة أخرى (غير متوقع)
          else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}
