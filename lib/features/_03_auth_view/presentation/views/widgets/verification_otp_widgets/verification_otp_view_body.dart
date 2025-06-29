import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/custom_auth_text.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_otp_widgets/verification_opt_input_data_section.dart';
import 'package:road_man_project/generated/assets.dart';

import '../common_widgets/custom_image.dart';

class VerificationOtpViewBody extends StatelessWidget {
  const VerificationOtpViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
      ), // 5% من العرض بدل 16 بكسل
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
            padding: EdgeInsets.only(
              top: screenHeight * 0.07,
              bottom: screenHeight * .03,
            ), // 7% من الطول بدل 58 بكسل
            child: CustomAuthText(
              text:
                  'We have sent a verification code to your email or phone number. Enter the code below to complete the process.',
              textAlign: TextAlign.center,
            ),
          ),
          VerificationOtpInputDataSection(email: email),
        ],
      ),
    );
  }
}
