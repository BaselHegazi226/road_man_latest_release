import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo_impl.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_app_bar.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_body.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_blocs/Learning_path_bloc.dart';

import '../../../../core/helper/const_variables.dart';
import '../view_model/learning_path_bloc/learning_path_cubit/learning_path_states.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final Map<int, int> selectedAnswers = {};
  final Map<int, bool> hasAnsweredMap = {};
  int correctCount = 0;
  int incorrectCount = 0;

  LearnPathQuizModel? _quizModel; // ✅ Nullable بدل late final

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_quizModel != null) return; // ✅ منع إعادة التهيئة

    final extra = GoRouterState.of(context).extra;
    if (extra is LearnPathQuizModel) {
      _quizModel = extra;
    } else {
      _quizModel = LearnPathQuizModel(
        id: 0,
        title: '',
        createdAt: DateTime.now(),
        isCompleted: false,
        questions: [],
      );
    }
  }

  void _onAnswerSelected(int questionId, int answerId, bool isCorrect) {
    if (hasAnsweredMap[questionId] == true) return;

    setState(() {
      selectedAnswers[questionId] = answerId;
      hasAnsweredMap[questionId] = true;
      isCorrect ? correctCount++ : incorrectCount++;
    });
  }

  void _onInitialCountCalculated(int correct, int incorrect) {
    setState(() {
      correctCount = correct;
      incorrectCount = incorrect;
    });
  }

  void _onFinishQuiz() {
    // يمكن إضافة منطق إضافي هنا إذا لزم
  }

  @override
  Widget build(BuildContext context) {
    if (_quizModel == null || _quizModel!.questions.isEmpty) {
      return Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        body: const Center(child: Text('Invalid quiz data. Please try again.')),
      );
    }

    return BlocProvider(
      create:
          (context) =>
              LearningPathBloc(learningPathRepo: LearningPathRepoImpl()),
      child: BlocBuilder<LearningPathBloc, LearningPathStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kAppPrimaryWhiteColor,
            appBar: QuizViewAppBar(
              correctCount: correctCount,
              incorrectCount: incorrectCount,
            ),
            body: QuizViewBody(
              selectedAnswers: selectedAnswers,
              hasAnsweredMap: hasAnsweredMap,
              onAnswerSelected: _onAnswerSelected,
              learnPathQuizModel: _quizModel!,
              onFinish: _onFinishQuiz,
              onInitialCountCalculated: _onInitialCountCalculated,
            ),
          );
        },
      ),
    );
  }
}
