import 'package:flutter/material.dart';

import 'widgets/onboarding_page_view_widgets/on_boarding_description_and_button_section.dart';
import 'widgets/onboarding_page_view_widgets/onboarding_indicator_section.dart';
import 'widgets/onboarding_view_widgets/onboarding_const_class.dart';
import 'widgets/onboarding_view_widgets/onboarding_view_image_section.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
    required this.index,
    required this.currentPage,
    required this.onNextPressed,
    required this.onSkipPressed,
  });

  final int index;
  final int currentPage;
  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final currentData = OnboardingConstClass.onboardingDataList[index];

    return Column(
      children: [
        OnBoardingViewImageSection(image: currentData.image),
        SizedBox(height: screenHeight * .085),
        OnboardingIndicatorSection(currentPage: currentPage),
        SizedBox(height: screenHeight * .02),
        OnboardingDescriptionAndButtonSection(
          title1: currentData.title1,
          title2: currentData.title2,
          subTitle: currentData.subTitle,
          nextButtonOnPressed: onNextPressed,
          skipButtonOnPressed: onSkipPressed,
          currentPage: currentPage,
        ),
      ],
    );
  }
}
