import 'package:flutter/material.dart';

import '../common_widgets/auth_component_section.dart';
import '../common_widgets/auth_sub_title.dart';
import 'sign_in_input_data_section.dart';

class SignInComponentSection extends StatelessWidget {
  const SignInComponentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AuthComponentSection(
      title: 'Sign in to your account',
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
        ), // بدل 16px
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
              ), // بدل 24px
              child: const AuthSubTitle(subTitle: 'Use Your Email Account'),
            ),
            SignInInputDataSection(),
          ],
        ),
      ),
    );
  }
}
