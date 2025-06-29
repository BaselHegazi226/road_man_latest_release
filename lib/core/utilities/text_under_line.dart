import 'package:flutter/material.dart';

import 'base_text_styles.dart';

class TextUnderLine extends StatelessWidget {
  const TextUnderLine({
    super.key,
    required this.text,
    required this.textColor,
    this.textWeight = FontWeight.w600,
    this.textSize = 16,
    this.letterSpacing = 1,
  });
  final String text;
  final Color textColor;
  final FontWeight textWeight;
  final double textSize, letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: AfacadTextStyles.textStyle16W600HBlue(context).copyWith(
        color: textColor,
        decoration: TextDecoration.underline,
        decorationColor: textColor.withAlpha(126),
        fontWeight: textWeight,
        fontSize: textSize,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
