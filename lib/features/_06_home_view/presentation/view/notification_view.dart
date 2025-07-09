import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/app_get.dart';
import 'package:road_man_project/core/utilities/shimmer_app.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/01_notification_widgets/notification_view_body.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/01_notification_widgets/notifications_view_app_bar.dart';

import '../../../../core/helper/const_variables.dart';
import '../view_model/notifications/notification_cubit.dart';
import '../view_model/notifications/notification_states.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AppGet.getIt<NotificationCubit>()..fetchAllNotification(),
      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        appBar: notificationViewAppbar(context),
        body: BlocBuilder<NotificationCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationSuccess) {
              return NotificationViewBody(notifications: state.notifications);
            } else if (state is NotificationLoading) {
              return const NotificationViewShimmer();
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
