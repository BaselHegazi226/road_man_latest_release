import 'package:flutter/material.dart';

import '../../../../../core/utilities/base_text_styles.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        'Your Journey Start Here 🚀🚀',
        textAlign: TextAlign.center,
        style: AfacadTextStyles.textStyle18W400Blue(
          context,
        ).copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
