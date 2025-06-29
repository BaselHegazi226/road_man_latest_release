import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/question_model.dart';
import '../../view_model/questionnaire_cubit/questionnaire_cubit.dart';

class CheckboxQuestionWidget extends StatelessWidget {
  final QuestionModel question;

  const CheckboxQuestionWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionnaireCubit>();
    final options = question.answers.map((a) => a.text).toList();
    final selectedValues = cubit.getCheckboxSelections(question.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text, style: _questionTextStyle),
        const SizedBox(height: 8),
        ...options.map(
          (option) => CheckboxListTile(
            title: Text(option),
            value: selectedValues.contains(option),
            onChanged:
                (selected) => cubit.selectCheckboxOption(
                  question.pageNumber,
                  question.id,
                  option,
                  selected ?? false,
                ),
          ),
        ),
      ],
    );
  }

  TextStyle get _questionTextStyle =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
