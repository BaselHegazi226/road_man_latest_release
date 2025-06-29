import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/questionnaire_view_body.dart';

import '../../data/repos/questionnaire_repo_implement.dart';
import '../view_model/questionnaire_cubit/questionnaire_cubit.dart';

class QuestionnaireView extends StatelessWidget {
  const QuestionnaireView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => QuestionnaireCubit(
            questionnaireRepo: QuestionnaireRepoImplement(),
          )..fetchAllQuestions(),
      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        appBar: AppBar(backgroundColor: kAppPrimaryWhiteColor, elevation: 0),
        body: const QuestionnaireViewBody(),
      ),
    );
  }
}
