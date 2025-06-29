import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../core/utilities/shadows.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double questionContainerHeight = screenHeight * .06;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: questionContainerHeight,
        padding: EdgeInsets.symmetric(vertical: questionContainerHeight / 3),
        decoration: BoxDecoration(
          color: kQuestionnaireButtonColor,
          borderRadius: BorderRadius.circular(screenWidth * .04),
          boxShadow: const [BoxShadows.blackShadow],
        ),
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: AfacadTextStyles.textStyle14W500Black(context),
        ),
      ),
    );
  }
}
