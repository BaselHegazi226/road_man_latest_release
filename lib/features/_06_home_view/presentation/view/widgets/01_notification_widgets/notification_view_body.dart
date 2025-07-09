import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_home_view/data/model/notification_model.dart';

import 'notification_day_section.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key, required this.notifications});
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: screenHeight * .02)),
          NotificationDaySection(notifications: notifications),
        ],
      ),
    );
  }
}
