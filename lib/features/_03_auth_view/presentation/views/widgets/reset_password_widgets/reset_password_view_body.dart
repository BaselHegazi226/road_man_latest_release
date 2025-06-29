import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/Assets.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/custom_auth_text.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/reset_password_widgets/reset_password_input_data_section.dart';

import '../common_widgets/custom_image.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key, required this.emailAndOtp});
  final Map<String, dynamic> emailAndOtp;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return CustomFlexibleWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
        child: Column(
          spacing: screenHeight * .02,
          children: [
            CustomImage(
              imageBottomPadding: screenHeight * .005,
              image: kResetPasswordImage,
            ),
            const CustomAuthText(
              text:
                  'Create a new password for your account.                                                    Make sure to choose a strong and secure password',
            ),
            ResetPasswordInputDataSection(emailAndOtp: emailAndOtp),
          ],
        ),
      ),
    );
  }
}
