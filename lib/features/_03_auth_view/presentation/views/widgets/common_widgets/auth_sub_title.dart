import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class AuthSubTitle extends StatelessWidget {
  const AuthSubTitle({
    super.key,
    required this.subTitle,
    this.textColor = kAppPrimaryBlackColor,
  });
  final String subTitle;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      subTitle,
      style: AfacadTextStyles.textStyle16W500H150Black(
        context,
      ).copyWith(color: textColor, letterSpacing: -0.304),
    );
  }
}
