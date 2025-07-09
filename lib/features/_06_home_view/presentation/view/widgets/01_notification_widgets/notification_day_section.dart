import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_home_view/data/model/notification_model.dart';

import '../../../../../../core/utilities/base_text_styles.dart';
import 'notification_view_day_text.dart';
import 'notification_view_item.dart';

class NotificationDaySection extends StatelessWidget {
  const NotificationDaySection({super.key, required this.notifications});
  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    if (notifications.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            'Not Yet Notifications Now!',
            textAlign: TextAlign.center,
            style: AfacadTextStyles.textStyle16W600Grey(context),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final DateTime currentDate = DateTime.now().subtract(
          Duration(days: index),
        );
        final String dayText = _formatDayText(currentDate, index);

        // تصفية الإشعارات الخاصة بهذا اليوم فقط
        final List<NotificationModel> notificationsForDay =
            notifications.where((notification) {
              return _isSameDay(notification.creationDate, currentDate);
            }).toList();

        if (notificationsForDay.isEmpty) {
          return const SizedBox(); // تجاهل اليوم لو مفيش إشعارات
        }

        return Padding(
          padding: EdgeInsets.only(bottom: screenHeight * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationViewDayText(dayText: dayText, dateTime: currentDate),
              SizedBox(height: screenHeight * 0.01),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notificationsForDay.length,
                itemBuilder: (context, itemIndex) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * .015),
                    child: NotificationViewItem(
                      notificationModel: notificationsForDay[itemIndex],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }, childCount: notifications.length),
    );
  }

  String _formatDayText(DateTime date, int index) {
    if (index == 0) return "Today";
    if (index == 1) return "Yesterday";
    return "${date.day}/${date.month}/${date.year}";
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
