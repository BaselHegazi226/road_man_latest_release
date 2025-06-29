import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

class LearningPreferencesCard extends StatelessWidget {
  const LearningPreferencesCard({
    super.key,
    required this.screenSize,
    required this.cardText,
  });
  final Size screenSize;
  final String cardText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      height: screenSize.height * .06,
      padding: EdgeInsets.all(screenSize.width * .04),
      decoration: BoxDecoration(
        color: kLearningPreferencesCardColor,
        borderRadius: BorderRadius.circular(screenSize.width * .04),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          cardText,
          style: AfacadTextStyles.textStyle14W600DeepGrey(
            context,
          ).copyWith(color: kLearningPreferencesCardTextColor),
        ),
      ),
    );
  }
}
