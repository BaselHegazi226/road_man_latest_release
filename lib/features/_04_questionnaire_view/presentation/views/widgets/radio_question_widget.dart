import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/question_model.dart';
import '../../view_model/questionnaire_cubit/questionnaire_cubit.dart';

class RadioQuestionWidget extends StatelessWidget {
  final QuestionModel question;

  const RadioQuestionWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionnaireCubit>();
    final options = question.answers.map((a) => a.text).toList();
    final selectedValue = cubit.getRadioSelection(question.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text, style: _questionTextStyle),
        const SizedBox(height: 8),
        ...options.map(
          (option) => RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedValue,
            onChanged:
                (value) => cubit.selectRadioOption(
                  question.pageNumber,
                  question.id,
                  value!,
                ),
          ),
        ),
      ],
    );
  }

  TextStyle get _questionTextStyle =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
