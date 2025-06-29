import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/question_page.dart';

import '../../../data/model/question_model.dart';
import '../../view_model/questionnaire_cubit/questionnaire_cubit.dart';

class FlowQuestionWidget extends StatelessWidget {
  final List<QuestionModel> pageData;

  const FlowQuestionWidget({super.key, required this.pageData});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionnaireCubit>();
    final question = pageData.first;

    return QuestionPage(
      questionText: question.text,
      options: question.answers,
      onOptionSelected: (option) => cubit.selectFlowOption(question.id, option),
    );
  }
}
