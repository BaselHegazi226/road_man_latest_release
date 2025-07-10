import 'package:flutter/material.dart';

import 'notification_view_item_shimmer.dart';

class NotificationViewShimmer extends StatelessWidget {
  const NotificationViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: NotificationViewItemShimmer(),
        ),
        childCount: 6, // عدد الـ shimmer اللي يظهر
      ),
    );
  }
}
