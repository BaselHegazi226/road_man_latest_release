import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';
import 'recommended_jobs_section_widgets/job_card.dart';

class RecommendedJobsSection extends StatelessWidget {
  const RecommendedJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Jobs',
          style: AfacadTextStyles.textStyle20W700Blue(
            context,
          ).copyWith(height: 1.50, letterSpacing: -0.38),
        ),
        SizedBox(height: screenSize.height * 0.01),
        SizedBox(
          height: screenSize.height * 0.25,
          // استخدام BlocBuilder لمراقبة حالات RecommendedJobsCubit
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
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.jobs.length,
                  itemBuilder: (context, index) {
                    final job = state.jobs[index];
                    return Padding(
                      padding: EdgeInsets.only(right: screenSize.width * .05),
                      child: JobCard(job: job),
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
        ),
      ],
    );
  }
}