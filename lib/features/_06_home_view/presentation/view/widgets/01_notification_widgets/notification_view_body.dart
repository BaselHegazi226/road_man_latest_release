import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/shimmer/home_shimmer/notification_view_shimmer.dart';

import '../../../view_model/notifications/notification_states.dart';
import '../../../view_model/notifications/notifications_cubit.dart';
import 'notification_day_section.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: screenHeight * .02)),
                NotificationDaySection(notifications: state.notifications),
              ],
            ),
          );
        } else if (state is NotificationLoading) {
          return const NotificationViewShimmer();
        } else if (state is NotificationFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return SliverToBoxAdapter(child: const SizedBox.shrink());
        }
      },
    );
  }
}
