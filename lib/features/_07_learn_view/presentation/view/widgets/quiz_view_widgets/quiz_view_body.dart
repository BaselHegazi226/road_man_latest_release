import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/manager/tokens_manager.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_model.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_user_answer_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_blocs/Learning_path_bloc.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_blocs/Learning_path_events.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit/learning_path_cubit.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit/learning_path_states.dart';

import '../../../../../../core/manager/user_learning_path_manager.dart';

class QuizViewBody extends StatefulWidget {
  final Map<int, int?> selectedAnswers;
  final Map<int, bool> hasAnsweredMap;
  final Function(int, int, bool) onAnswerSelected;
  final LearnPathQuizModel learnPathQuizModel;
  final void Function()? onFinish;
  final void Function(int correctCount, int incorrectCount)?
  onInitialCountCalculated;

  const QuizViewBody({
    super.key,
    required this.selectedAnswers,
    required this.hasAnsweredMap,
    required this.onAnswerSelected,
    required this.learnPathQuizModel,
    required this.onFinish,
    this.onInitialCountCalculated,
  });

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  bool isLoadingButton = false;
  bool isFinished = false;
  late String userToken;

  @override
  void initState() {
    log('isFinished = $isFinished');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadUserToken();
      await _loadLocalAnswers();
    });
  }

  Future<void> _loadUserToken() async {
    final userTokensModel = await SecureStorageHelper.getUserTokens();
    if (!mounted) return;
    userToken = userTokensModel?.token ?? '';
  }

  /// تحميل الإجابات من التخزين المحلي وتحديث الحالة
  Future<void> _loadLocalAnswers() async {
    final localAnswers = UserLearningPathHelper.getAllUserAnswers();
    log('local data : ${localAnswers.toString()}');
    final userAnswers = localAnswers.where(
      (e) => e.quizId == widget.learnPathQuizModel.id,
    );

    int correct = 0;
    int incorrect = 0;

    if (userAnswers.isNotEmpty) {
      setState(() {
        isFinished = true;
        for (var answer in userAnswers) {
          final questionId = answer.questionId;
          widget.selectedAnswers[questionId] = answer.answerId;
          widget.hasAnsweredMap[questionId] = true;
          answer.isCorrect ? correct++ : incorrect++;
        }
        log('correct answers :$correct');
        log('incorrect answers :$incorrect');
      });

      widget.onInitialCountCalculated?.call(correct, incorrect);
    }
  }

  bool _areAllQuestionsAnswered() {
    return widget.selectedAnswers.values.every((answer) => answer != null);
  }

  void _handleFinish() async {
    final totalQuestions = widget.learnPathQuizModel.questions.length;
    final answeredQuestionsCount = widget.selectedAnswers.values.length;
    final remainingQuestions = totalQuestions - answeredQuestionsCount;

    if (answeredQuestionsCount == totalQuestions) {
      setState(() => isFinished = true);
      widget.onFinish?.call();

      log('userToken : $userToken');
      log('quiz id : ${widget.learnPathQuizModel.id}');
      log('answered count : $answeredQuestionsCount');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kAppPrimaryWrongColor,
          content: Text(
            "You still have $remainingQuestions unanswered question(s). Please answer all questions before finishing.",
          ),
        ),
      );
      log('IsFinished value = $isFinished');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    if (widget.learnPathQuizModel.questions.isEmpty) {
      return const Center(child: Text("No questions available"));
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        physics: const BouncingScrollPhysics(),
        itemCount: widget.learnPathQuizModel.questions.length + 1,
        itemBuilder: (context, index) {
          if (index < widget.learnPathQuizModel.questions.length) {
            final question = widget.learnPathQuizModel.questions[index];

            return Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.02),
              child: QuizViewCard(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                learningPathQuestionModel: question,
                selectedAnswer: widget.selectedAnswers[question.id] ?? 0,
                hasAnswered: widget.hasAnsweredMap[question.id] ?? false,
                isFinished: isFinished,
                onAnswerSelected: (answerId, isCorrect) {
                  if (!isFinished) {
                    setState(() {
                      widget.onAnswerSelected(question.id, answerId, isCorrect);
                      widget.hasAnsweredMap[question.id] = true;
                    });

                    final selectedAnswer = widget.learnPathQuizModel.questions
                        .firstWhere((q) => q.id == question.id)
                        .answers
                        .firstWhere((a) => a.id == answerId);

                    final userAnswer = LearnPathUserAnswerModel(
                      quizId: widget.learnPathQuizModel.id,
                      questionId: question.id,
                      answerId: selectedAnswer.id,
                      userAnswerId:
                          '${widget.learnPathQuizModel.id}_${question.id}',
                      isCorrect: selectedAnswer.isCorrect,
                    );

                    UserLearningPathHelper.saveUserAnswer(userAnswer);
                  }
                },
              ),
            );
          } else {
            return Align(
              alignment: Alignment.centerRight,
              child: BlocConsumer<LearningPathBloc, LearningPathStates>(
                listener: (context, state) {
                  if (state is QuizCompletedPostSuccess) {
                    widget.onFinish?.call();
                    isFinished = state.finished;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: kAppPrimaryBlueColor,
                        content: Text("Quiz Answers Are Sent Successfully!"),
                      ),
                    );
                    getQuizCompletedFun(context);
                  } else if (state is QuizCompletedPostFailure) {
                    log('error :${state.errorMessage}');
                  }
                  setState(
                    () => isLoadingButton = state is QuizCompletedPostLoading,
                  );
                },
                builder: (context, state) {
                  return CustomTextButton(
                    onPressed:
                        isLoadingButton || isFinished
                            ? null
                            : () {
                              final currentAnswered =
                                  widget.selectedAnswers.values.length;
                              context.read<LearningPathBloc>().add(
                                QuizCompletedEvent(
                                  userToken: userToken,
                                  quizId: widget.learnPathQuizModel.id,
                                  questionsAnswered: currentAnswered,
                                ),
                              );
                              _handleFinish();
                            },
                    buttonWidth: screenWidth * 0.35,
                    buttonHeight: screenHeight * 0.04,
                    backgroundColor:
                        _areAllQuestionsAnswered()
                            ? kAppPrimaryBlueColor
                            : kQuizViewSecondlyColor,
                    child:
                        isLoadingButton
                            ? const CustomCircleIndicator(width: 2)
                            : CustomTitle(title: 'Finish', size: 16),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  void getQuizCompletedFun(BuildContext context) {
    context.read<LearningPathCubit>().getQuizCompleted(
      quizId: widget.learnPathQuizModel.id,
      userToken: userToken,
    );
  }
}
