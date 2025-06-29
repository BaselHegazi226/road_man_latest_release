import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utilities/base_text_styles.dart';
import '../../../../../../generated/assets.dart';

class StartCard extends StatelessWidget {
  const StartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(Assets.learningPathCardImage, height: 51, width: 80),
        Text('Start', style: AfacadTextStyles.textStyle16W600HBlue(context)),
      ],
    );
  }
}
