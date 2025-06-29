import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_08_job_view/data/repos/jobs_repo_implement.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/notification_widgets/notification_view_body.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/notification_widgets/notifications_view_app_bar.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view_model/recent_jobs/recent_jobs_cubit.dart';

import '../../../../core/helper/const_variables.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              NotificationCubit(JobsRepoImplement())..fetchAllNotification(),

      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        appBar: notificationViewAppbar(context),
        body: BlocBuilder<NotificationCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationSuccess) {
              return NotificationViewBody(notifications: state.notifications);
            } else if (state is NotificationLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NotificationFailure) {
              return Center(child: Text(state.errorMessage));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
