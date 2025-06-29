import 'package:flutter/cupertino.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/radio_question_widget.dart';

import '../../../data/model/question_model.dart';
import 'checkbox_question_widget.dart';

class QuestionListPage extends StatelessWidget {
  final List<QuestionModel> pageData;

  const QuestionListPage({super.key, required this.pageData});

  @override
  Widget build(BuildContext context) {
    final sortedQuestions = List<QuestionModel>.from(pageData)
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            sortedQuestions.map((question) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildQuestionWidget(question),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildQuestionWidget(QuestionModel question) {
    if (question.questionForm == 'RadioButton') {
      return RadioQuestionWidget(question: question);
    } else if (question.questionForm == 'CheckBox') {
      return CheckboxQuestionWidget(question: question);
    }
    return const SizedBox.shrink();
  }
}
