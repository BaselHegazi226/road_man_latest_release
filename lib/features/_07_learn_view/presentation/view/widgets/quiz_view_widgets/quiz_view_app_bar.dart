import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

class QuizViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int correctCount;
  final int incorrectCount;

  const QuizViewAppBar({
    super.key,
    required this.correctCount,
    required this.incorrectCount,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return AppBar(
      backgroundColor: kQuizViewPrimaryColor,
      titleSpacing: screenWidth * .04,
      leading: IconButton(
        padding: EdgeInsets.only(top: screenHeight * .02),
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 24,
          color: kAppPrimaryBlueColor,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: screenHeight * .02),
        child: Text(
          'Level 1 Test',
          style: AfacadTextStyles.textStyle20W500Blue(context),
        ),
      ),
      actions: [_buildScoreCounter(context, screenWidth, screenHeight)],
    );
  }

  Widget _buildScoreCounter(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * .04, bottom: 8),
      child: Row(
        spacing: screenWidth * .04,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildScoreColumn(
            '$correctCount',
            'Correct',
            kAppPrimaryCorrectColor,
            context,
          ),
          const VerticalDivider(
            color: kAppPrimaryBlackColor,
            thickness: 1,
            indent: 8,
          ),
          _buildScoreColumn(
            '$incorrectCount',
            'INCorrect',
            kAppPrimaryWrongColor,
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildScoreColumn(
    String count,
    String label,
    Color color,
    BuildContext context,
  ) {
    return Column(
      spacing: MediaQuery.sizeOf(context).height * .005,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          count,
          style: MontserratTextStyles.textStyle16W600Black(
            context,
          ).copyWith(color: color),
        ),
        Text(
          label,
          style: AfacadTextStyles.textStyle14W600Black(
            context,
          ).copyWith(color: color),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
