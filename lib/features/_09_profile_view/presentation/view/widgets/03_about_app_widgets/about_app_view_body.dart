import 'package:flutter/material.dart';

import '../00_profile_common_widgets/custom_title_subtitle.dart';
import 'key_features_section.dart';

class AboutAppViewBody extends StatelessWidget {
  const AboutAppViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          CustomTitleSubtitle(
            title: 'What is Road Man?',
            subTitle:
                'Road Man is a smart app that helps you build your learning path based on your current skills and future goals. Using artificial intelligence, we provide you with personalized learning resources, tests to measure your progress, and job recommendations that suit your level.',
          ),
          KeyFeaturesSection(),
          CustomTitleSubtitle(
            title: 'Our Vision',
            subTitle:
                '"We strive to make learning more personalized and effective to help you achieve your professional and personal goals."',
          ),
        ],
      ),
    );
  }
}
