import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_question_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card_question_answers.dart';

import '../../../../../../core/helper/const_variables.dart';

class QuizViewCard extends StatelessWidget {
  const QuizViewCard({
    super.key,
    required this.learningPathQuestionModel,
    required this.screenHeight,
    required this.screenWidth,
    required this.selectedAnswer,
    required this.hasAnswered,
    required this.onAnswerSelected,
    required this.isFinished,
  });

  final double screenHeight, screenWidth;
  final LearningPathQuestionModel learningPathQuestionModel;
  final int selectedAnswer;
  final bool hasAnswered, isFinished;
  final Function(int, bool) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    log('Isfinished from card= $isFinished');
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.22,
          minHeight: 0,
        ),
        width: screenWidth,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          color: kQuizViewWhiteColor,
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
              color: const Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: QuizViewCardQuestionAnswers(
            question: learningPathQuestionModel.text,
            answers: learningPathQuestionModel.answers,
            selectedAnswer: selectedAnswer,
            hasAnswered: hasAnswered,
            isFinished: isFinished,
            onAnswerSelected: onAnswerSelected,
          ),
        ),
      ),
    );
  }
}
