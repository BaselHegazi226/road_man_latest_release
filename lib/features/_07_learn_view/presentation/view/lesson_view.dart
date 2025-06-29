import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/lesson_view_widgets/lesson_view_body.dart';

import '../../data/repos/learning_path_repo_impl.dart';
import '../view_model/learning_path_bloc/learning_path_blocs/Learning_path_bloc.dart';
import '../view_model/learning_path_bloc/learning_path_cubit/learning_path_cubit.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});
  @override
  Widget build(BuildContext context) {
    final learnPathModel = GoRouterState.of(context).extra as LearnPathModel;
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        context,
        text: learnPathModel.title,
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    LearningPathBloc(learningPathRepo: LearningPathRepoImpl()),
          ),
          BlocProvider(
            create:
                (context) =>
                    LearningPathCubit(learningPathRepo: LearningPathRepoImpl()),
          ),
        ],
        child: LessonViewBody(learnLessonModelList: learnPathModel.lessons),
      ),
    );
  }
}
