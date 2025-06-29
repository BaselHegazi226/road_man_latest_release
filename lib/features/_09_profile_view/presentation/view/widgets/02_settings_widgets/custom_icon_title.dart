import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class CustomIconTitle extends StatelessWidget {
  const CustomIconTitle({
    super.key,
    required this.iconData,
    required this.title,
    this.textColor = kTextBlackPrimaryColor,
    this.iconColor = kIconSettingsColor,
  });
  final IconData iconData;
  final String title;
  final Color textColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: screenSize.width * .02,
      children: [
        Icon(iconData, size: 24, color: iconColor),
        Text(
          title,
          style: AfacadTextStyles.textStyle16W600Black(
            context,
          ).copyWith(color: textColor),
        ),
      ],
    );
  }
}
