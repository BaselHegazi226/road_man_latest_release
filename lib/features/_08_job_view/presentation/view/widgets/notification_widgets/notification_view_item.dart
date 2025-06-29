import 'package:flutter/cupertino.dart';
import 'package:road_man_project/features/_08_job_view/data/model/notification_model.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'notification_access_time_section.dart';
import 'notification_message_section.dart';

class NotificationViewItem extends StatelessWidget {
  const NotificationViewItem({super.key, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      height: screenHeight * 0.103,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.01,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffD5DCF3),
        borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: screenWidth * 0.02,
        children: [
          NotificationViewItemBellSection(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: screenHeight * 0.005,
              children: [
                NotificationMessageSection(
                  notificationText: notificationModel.text!,
                ),
                NotificationAccessTimeSection(
                  hour:
                      '${DateTime.now().difference(notificationModel.creationDate).inHours}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationViewItemBellSection extends StatelessWidget {
  const NotificationViewItemBellSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Icon(
      CupertinoIcons.bell_circle_fill,
      color: kAppPrimaryBlueColor,
      size: screenWidth * 0.078, // بدلًا من 32
    );
  }
}
