import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class OnBoardingViewDescriptionSection extends StatelessWidget {
  const OnBoardingViewDescriptionSection({
    super.key,
    required this.title1,
    required this.title2,
    required this.subTitle,
  });
  final String title1, title2, subTitle;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: screenHeight * 0.02,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: AfacadTextStyles.textStyle24W600H150Black(context),
            ),
            Text(
              title2,
              style: AfacadTextStyles.textStyle24W600H150Black(context),
            ),
          ],
        ),
        Text(
          subTitle,
          style: AfacadTextStyles.textStyle16W400H150Black(context),
        ),
      ],
    );
  }
}
