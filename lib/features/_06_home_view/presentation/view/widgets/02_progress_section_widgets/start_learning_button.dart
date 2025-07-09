import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class StartLearningButton extends StatelessWidget {
  const StartLearningButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * .02,
        vertical: screenSize.height * .005,
      ),
      margin: EdgeInsets.only(top: screenSize.height * .02),
      decoration: BoxDecoration(
        color: kAppPrimaryBlueColor,
        borderRadius: BorderRadius.circular(screenSize.width * .02),
      ),
      child: Text(
        'Start learning',
        style: AfacadTextStyles.textStyle14W500White(
          context,
        ).copyWith(color: Color(0xffF8F9FB)),
      ),
    );
  }
}
