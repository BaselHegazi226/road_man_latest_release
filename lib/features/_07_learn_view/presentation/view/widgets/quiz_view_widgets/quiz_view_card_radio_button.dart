import 'package:flutter/material.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_answer_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card_radio_button_circle.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card_radio_button_text.dart';

class QuizViewCardRadioButton extends StatefulWidget {
  const QuizViewCardRadioButton({
    super.key,
    required this.answers,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.isFinished,
  });

  final List<LearnPathAnswerModel> answers;
  final int selectedAnswer;
  final Function(int, bool) onAnswerSelected;
  final bool isFinished;

  @override
  State<QuizViewCardRadioButton> createState() =>
      _QuizViewCardRadioButtonState();
}

class _QuizViewCardRadioButtonState extends State<QuizViewCardRadioButton> {
  int? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    _selectedAnswer = widget.selectedAnswer;
  }

  @override
  void didUpdateWidget(covariant QuizViewCardRadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedAnswer != widget.selectedAnswer) {
      setState(() {
        _selectedAnswer = widget.selectedAnswer;
      });
    }
  }

  void _onSelectAnswer(int answer, bool isCorrect) {
    if (!widget.isFinished) {
      setState(() {
        _selectedAnswer = answer;
      });
      widget.onAnswerSelected(answer, isCorrect);
    }
  }

  Color _getAnswerColor(bool isCorrect, bool isSelected) {
    if (widget.isFinished) {
      return isCorrect
          ? Colors.green
          : (isSelected ? Colors.red : Colors.black);
    }
    return isSelected ? Colors.grey : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      children:
          widget.answers.map((answer) {
            final isSelected = _selectedAnswer == answer.id;

            return GestureDetector(
              onTap: () => _onSelectAnswer(answer.id, answer.isCorrect),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * .005),
                child: Row(
                  children: [
                    QuizViewCardRadioButtonCircle(
                      isSelected: isSelected,
                      size: screenWidth * .06,
                      selectedColor: _getAnswerColor(
                        answer.isCorrect,
                        isSelected,
                      ),
                      unselectedColor: Colors.black,
                    ),
                    SizedBox(width: screenWidth * .02),
                    Expanded(
                      child: QuizViewCardRadioButtonText(
                        answerText: answer.text!,
                        isSelected: isSelected,
                        selectedColor: _getAnswerColor(
                          answer.isCorrect,
                          isSelected,
                        ),
                        unselectedColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}
