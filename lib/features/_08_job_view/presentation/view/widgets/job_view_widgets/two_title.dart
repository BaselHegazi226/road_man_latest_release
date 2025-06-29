import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class TwoTitle extends StatelessWidget {
  const TwoTitle({
    super.key,
    required this.title1,
    required this.title2,
    required this.title2onPressed,
  });
  final String title1, title2;
  final VoidCallback? title2onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title1, style: AfacadTextStyles.textStyle16W500H150Black(context)),
        TextButton(
          onPressed: title2onPressed,
          child: Text(
            title2,
            style: AfacadTextStyles.textStyle16W600HBlue(context),
          ),
        ),
      ],
    );
  }
}
