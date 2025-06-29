import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/auth_component_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_input_data_section.dart';

import '../common_widgets/auth_sub_title.dart';

class SignUpComponentSection extends StatelessWidget {
  const SignUpComponentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return AuthComponentSection(
      title: 'Create New Account',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
              ), // بدل 24px
              child: const AuthSubTitle(subTitle: 'Use Your Email Account'),
            ),
            SignUpInputDataSection(),
          ],
        ),
      ),
    );
  }
}
