import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/text_under_line.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed,
        child: TextUnderLine(
          textColor: kAppPrimaryWrongColor,
          text: 'Change Password',
        ),
      ),
    );
  }
}
