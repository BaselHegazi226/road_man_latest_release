import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: AfacadTextStyles.textStyle24W700Black(context).copyWith(
                color: kAppPrimaryBlueColor,
                height: 1.5,
                letterSpacing: -0.46,
              ),
            ),
            Text(
              "Let's make progress today!",
              style: AfacadTextStyles.textStyle20W400Black(
                context,
              ).copyWith(height: 1.5, letterSpacing: -0.38),
            ),
          ],
        ),
      ],
    );
  }
}
