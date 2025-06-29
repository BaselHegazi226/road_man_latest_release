import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/shadows.dart';

import '../../../../../core/helper/const_variables.dart';

class RadioButtonQuestion extends StatelessWidget {
  final List<String> questions;
  final List<List<String>> options;
  final List<String?> selections;
  final Function(int questionIndex, String value) onOptionSelected;

  const RadioButtonQuestion({
    super.key,
    required this.questions,
    required this.options,
    required this.selections,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          // Build a section for each question
          ...List.generate(questions.length, (questionIndex) {
            return buildQuestionSection(
              questionIndex: questionIndex,
              question: questions[questionIndex],
              options: options[questionIndex],
              selectedValue: selections[questionIndex],
            );
          }),
        ],
      ),
    );
  }

  Widget buildQuestionSection({
    required int questionIndex,
    required String question,
    required List<String> options,
    String? selectedValue,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFF4F5F8),
        boxShadow: [BoxShadows.blueShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question text
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              question,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          // Custom square radio buttons for options
          ...options.map(
            (option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: InkWell(
                onTap: () {
                  onOptionSelected(questionIndex, option);
                },
                child: Row(
                  children: [
                    // Square radio button
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color:
                            selectedValue == option
                                ? kAppPrimaryBlueColor
                                : Colors.white,
                        border: Border.all(
                          color:
                              selectedValue == option
                                  ? kAppPrimaryBlueColor
                                  : Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child:
                          selectedValue == option
                              ? const Icon(
                                Icons.check,
                                size: 18.0,
                                color: Colors.white,
                              )
                              : null,
                    ),
                    const SizedBox(width: 16),
                    // Option text
                    Expanded(
                      child: Text(option, style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
