import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class QuizViewCardRadioButtonText extends StatelessWidget {
  final String answerText;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;

  const QuizViewCardRadioButtonText({
    super.key,
    required this.answerText,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      answerText,
      style: AfacadTextStyles.textStyle13W400H150Black(context).copyWith(
        letterSpacing: -0.247,
        color: isSelected ? selectedColor : unselectedColor,
      ),
      softWrap: true, // السماح للنص باللف
    );
  }
}
