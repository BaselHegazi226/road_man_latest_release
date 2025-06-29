import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import 'custom_profile_title.dart';

class CustomTitleSubtitle extends StatelessWidget {
  const CustomTitleSubtitle({
    super.key,
    required this.title,
    required this.subTitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });
  final String title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        CustomProfileTitle(title: title),
        Text(subTitle, style: AfacadTextStyles.textStyle14W400Black(context)),
      ],
    );
  }
}
