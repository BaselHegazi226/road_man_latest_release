import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_02_onboarding_view/presentation/view/widgets/onboarding_page_view_widgets/onboarding_page_view_body.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      body: const OnboardingPageViewBody(),
    );
  }
}
