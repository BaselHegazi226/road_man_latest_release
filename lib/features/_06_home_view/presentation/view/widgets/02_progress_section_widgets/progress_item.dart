import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class ProgressItem extends StatelessWidget {
  final String title;
  final String value;
  final String image;

  const ProgressItem({
    super.key,
    required this.title,
    required this.value,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              image,
              width: screenSize.width * .06,
              height: screenSize.width * .06,
            ),
            SizedBox(width: screenSize.width * .02),
            Text(
              title,
              style: AfacadTextStyles.textStyle14W600H150Black(
                context,
              ).copyWith(letterSpacing: -0.266),
            ),
          ],
        ),
        SizedBox(width: screenSize.width * .04),
        Text(
          value,
          style: AfacadTextStyles.textStyle14W600H150Black(
            context,
          ).copyWith(letterSpacing: -0.266),
        ),
      ],
    );
  }
}
