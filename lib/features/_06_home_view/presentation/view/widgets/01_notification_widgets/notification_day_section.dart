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
        child: SizedBox(
          height: screenHeight * .6,
          child: Center(
            child: Text(
              'No Notifications Now! 🔔🔔 ',
              textAlign: TextAlign.center,
              style: AfacadTextStyles.textStyle20W600Blue(context),
            ),
          ),
        ),
      );
    }

    /// ✅ تجميع الإشعارات حسب تاريخ اليوم فقط (دون وقت)
    final Map<DateTime, List<NotificationModel>> groupedNotifications = {};

    for (final notification in notifications) {
      final creationDate = notification.creationDate;
      final dateOnly = DateTime(
        creationDate.year,
        creationDate.month,
        creationDate.day,
      );

      groupedNotifications.putIfAbsent(dateOnly, () => []);
      groupedNotifications[dateOnly]!.add(notification);
    }

    /// ✅ ترتيب التواريخ تنازليًا (الأحدث أولًا)
    final sortedDates =
        groupedNotifications.keys.toList()..sort((a, b) => b.compareTo(a));

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final currentDate = sortedDates[index];
        final String dayText = _formatDayText(currentDate);
        final List<NotificationModel> notificationsForDay =
            groupedNotifications[currentDate]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: screenHeight * 0.01,
          children: [
            NotificationViewDayText(dayText: dayText, dateTime: currentDate),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notificationsForDay.length,
              itemBuilder: (context, itemIndex) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: NotificationViewItem(
                    notificationModel: notificationsForDay[itemIndex],
                  ),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.015),
          ],
        );
      }, childCount: sortedDates.length),
    );
  }

  String _formatDayText(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) return "Today";
    if (dateOnly == yesterday) return "Yesterday";
    return "${date.day}/${date.month}/${date.year}";
  }
}
