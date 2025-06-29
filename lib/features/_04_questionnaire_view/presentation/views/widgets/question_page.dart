import 'package:flutter/material.dart';

import '../../../../../core/utilities/base_text_styles.dart';
import '../../../data/model/answer_model.dart';
import 'option_button.dart';

class QuestionPage extends StatelessWidget {
  final String questionText;
  final List<AnswerModel> options;
  final Function(AnswerModel option) onOptionSelected;

  const QuestionPage({
    super.key,
    required this.questionText,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: screenHeight * .04),
        Center(
          child: Text(
            questionText,
            textAlign: TextAlign.center,
            style: AfacadTextStyles.textStyle24W700Black(
              context,
            ).copyWith(height: 1.5),
          ),
        ),
        SizedBox(height: screenHeight * .04),
        ...options.map(
          (option) => Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .02),
            child: OptionButton(
              text: option.text,
              onPressed: () => onOptionSelected(option),
            ),
          ),
        ),
      ],
    );
  }
}
