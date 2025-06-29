import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/custom_auth_text.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_email_widgets/verification_email_input_data_section.dart';
import 'package:road_man_project/generated/assets.dart';

import '../common_widgets/custom_image.dart';

class VerificationEmailViewBody extends StatelessWidget {
  const VerificationEmailViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: screenHeight * .00085,
              child: CustomImage(image: Assets.authVerificationImage),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.07),
            child: CustomAuthText(
              text:
                  'We have sent a verification code to your email or phone number. Enter the code below to complete the process.',
              textAlign: TextAlign.center,
            ),
          ),
          VerificationEmailInputDataSection(email: email),
        ],
      ),
    );
  }
}
