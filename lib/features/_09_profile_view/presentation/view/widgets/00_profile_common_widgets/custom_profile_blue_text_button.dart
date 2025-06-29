import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class CustomProfileBlueTextButton extends StatelessWidget {
  const CustomProfileBlueTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: AfacadTextStyles.textStyle16W600HBlue(context)),
    );
  }
}
