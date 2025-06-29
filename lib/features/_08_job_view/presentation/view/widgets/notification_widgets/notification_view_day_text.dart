import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

class NotificationViewDayText extends StatelessWidget {
  const NotificationViewDayText({
    super.key,
    required this.dayText,
    required this.dateTime,
  });
  final String dayText;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('EEEE d, MMMM').format(dateTime);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dayText,
          style: AfacadTextStyles.textStyle14W500Black(
            context,
          ).copyWith(color: kTextGreyHalfOpacityPrimaryColor),
        ),
        Text(
          formattedDate,
          style: AfacadTextStyles.textStyle12W400Grey(
            context,
          ).copyWith(color: kTextGreyHalfOpacityPrimaryColor),
        ),
      ],
    );
  }
}
