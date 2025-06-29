import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomDashboardIconTitle extends StatelessWidget {
  const CustomDashboardIconTitle({
    super.key,
    required this.iconData,
    required this.title,
    this.textColor = kTextBlackPrimaryColor,
    this.iconColor = kIconSettingsColor,
    required this.onTap,
  });
  final IconData iconData;
  final String title;
  final Color textColor;
  final Color iconColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kAppPrimaryBlueColor.withAlpha(15),
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8,
        children: [
          Icon(iconData, size: 24, color: iconColor),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
