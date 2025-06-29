import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/text_under_line.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_me_section.dart';

class RememberMeForgetPasswordSection extends StatelessWidget {
  const RememberMeForgetPasswordSection({
    super.key,
    required this.forgetPasswordPressed,
  });
  final void Function()? forgetPasswordPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RememberMeSection(),
        TextButton(
          onPressed: forgetPasswordPressed,
          child: TextUnderLine(
            text: 'Forget your password ?',
            textColor: kAppPrimaryBlueColor,
            textWeight: FontWeight.bold,
            textSize: 14,
            letterSpacing: .266,
          ),
        ),
      ],
    );
  }
}
