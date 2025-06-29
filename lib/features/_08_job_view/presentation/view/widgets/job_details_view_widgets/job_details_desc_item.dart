import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class JobDetailsDescItem extends StatelessWidget {
  const JobDetailsDescItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                "We're looking for A junior front-end developer works on building the user interface of a mobile application or website. They showcase their skills with the application's visual elements, including graphics, typography, and layouts. They also ensure smooth interaction between the app and user. ",
            style: AfacadTextStyles.textStyle14W400Black(
              context,
            ).copyWith(height: 1.2),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'More details',
                style: AfacadTextStyles.textStyle14W400Blue(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
