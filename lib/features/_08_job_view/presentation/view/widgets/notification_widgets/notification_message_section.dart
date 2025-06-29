import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class NotificationMessageSection extends StatelessWidget {
  const NotificationMessageSection({super.key, required this.notificationText});

  final String notificationText;

  @override
  Widget build(BuildContext context) {
    return Text(
      notificationText,
      style: InterTextStyles.textStyle12W500Black(context),
    );
  }
}
