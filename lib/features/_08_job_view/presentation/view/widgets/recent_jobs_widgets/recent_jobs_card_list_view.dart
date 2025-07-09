import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/shimmer_app.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view_model/recent_jobs/recent_jobs_cubit.dart';

class RecentJobsCardListView extends StatelessWidget {
  final List<JobViewCardModel> recentJobsCardItemModelList;
  const RecentJobsCardListView({
    super.key,
    required this.recentJobsCardItemModelList,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Expanded(
      child: BlocBuilder<RecentJobsCubit, RecentJobsState>(
        builder: (context, state) {
          // 1. في حالة التحميل أو الحالة المبدئية
          if (state is RecentJobsLoading || state is RecentJobsInitial) {
            return const RecentJobsCardShimmer();
          }
          // 2. في حالة النجاح
          else if (state is RecentJobsSuccess) {
            // التحقق إذا كانت قائمة الوظائف فارغة
            if (state.jobs.isEmpty) {
              return const Center(child: Text('No recommended jobs found.'));
            }
            return ListView.builder(
              itemCount: recentJobsCardItemModelList.length,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final job = state.jobs[index];
                return Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.02,
                  ), // مسافة متجاوبة بين العناصر
                  child: RecentJobsCard(
                    recentJobsCardModel: JobViewCardModel(
                      title: job.title ?? '',
                      company: job.company ?? '',
                      location: job.location ?? '',
                      logo: recentJobsCardItemModelList[index].logo,
                      salary: job.salary ?? '',
                      salaryType: recentJobsCardItemModelList[index].salaryType,
                      jobType: job.jobType ?? '',
                      jobLevel: recentJobsCardItemModelList[index].jobLevel,
                      timeLeft:
                          recentJobsCardItemModelList[index].timeLeft ?? '',
                    ),
                  ),
                );
              },
            );
          }
          // 3. في حالة الفشل
          else if (state is RecentJobsFailure) {
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
