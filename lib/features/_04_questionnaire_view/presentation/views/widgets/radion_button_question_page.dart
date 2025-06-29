import 'package:flutter/material.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/radio_button_question.dart';

class RadioButtonQuestionPage extends StatelessWidget {
  final List<String> questions;
  final List<List<String>> options;
  final List<String?> selections;
  final Function(int questionIndex, String value) onOptionSelected;

  const RadioButtonQuestionPage({
    super.key,
    required this.questions,
    required this.options,
    required this.selections,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RadioButtonQuestion(
      questions: questions,
      options: options,
      selections: selections,
      onOptionSelected: onOptionSelected,
    );
  }
}
