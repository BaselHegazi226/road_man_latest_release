import 'package:flutter/material.dart';

import '../onboarding_view_widgets/onboarding_view_button_section.dart';
import '../onboarding_view_widgets/onboarding_view_description_section.dart';

class OnboardingDescriptionAndButtonSection extends StatelessWidget {
  const OnboardingDescriptionAndButtonSection({
    super.key,
    required this.title1,
    required this.title2,
    required this.subTitle,
    required this.skipButtonOnPressed,
    required this.nextButtonOnPressed,
    required this.currentPage,
  });

  final String title1, title2, subTitle;
  final VoidCallback skipButtonOnPressed, nextButtonOnPressed;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OnBoardingViewDescriptionSection(
            title1: title1,
            title2: title2,
            subTitle: subTitle,
          ),
          SizedBox(height: screenHeight * .03),
          OnBoardingViewButtonSection(
            skipButtonOnPressed: skipButtonOnPressed,
            nextButtonOnPressed: nextButtonOnPressed,
          ),
        ],
      ),
    );
  }
}
