import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

class NotNotificationViewBody extends StatelessWidget {
  const NotNotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: screenHeight * .005,
        children: [
          Icon(
            Icons.notifications_outlined,
            color: kAppPrimaryBlueColor,
            size: 160,
          ),
          Text(
            'No Notification Yet',
            style: AfacadTextStyles.textStyle24W700Black(context),
          ),
        ],
      ),
    );
  }
}
