import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

class NotificationAccessTimeSection extends StatelessWidget {
  const NotificationAccessTimeSection({super.key, required this.hour});

  final String hour;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: screenWidth * 0.01,
      children: [
        Icon(
          Icons.access_time_filled_outlined,
          color: kAppPrimaryBlueColor,
          size: screenWidth * 0.06,
        ),
        Text(hour, style: InterTextStyles.textStyle12W500Blue(context)),
      ],
    );
  }
}
