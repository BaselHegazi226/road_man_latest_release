import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class CustomAuthText extends StatelessWidget {
  const CustomAuthText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
  });
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 3,
      style: AfacadTextStyles.textStyle12W400Black(
        context,
      ).copyWith(letterSpacing: -.228),
      strutStyle: StrutStyle(leading: .3, forceStrutHeight: true),
    );
  }
}
