import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class OtherRegisterSection extends StatelessWidget {
  const OtherRegisterSection({
    super.key,
    required this.onTap,
    required this.blackText,
    required this.blueText,
  });
  final void Function()? onTap;
  final String blackText, blueText;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: screenWidth * 0.005,
        children: [
          Text(
            blackText,
            style: AfacadTextStyles.textStyle16W500H150Black(
              context,
            ).copyWith(letterSpacing: -.304),
          ),
          Text(
            blueText,
            style: AfacadTextStyles.textStyle16W700Blue(
              context,
            ).copyWith(letterSpacing: -.304, height: 1.5),
          ),
        ],
      ),
    );
  }
}
