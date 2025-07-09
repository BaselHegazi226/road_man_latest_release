import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class JobTag extends StatelessWidget {
  final String tag;
  const JobTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        color: kSecondlyDarkWhiteColor,
        borderRadius: BorderRadius.circular(screenSize.width * .02),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * .01,
        vertical: screenSize.height * .01,
      ),
      child: Text(
        tag,
        style: AfacadTextStyles.textStyle14W400Black(context),
        softWrap: true,
      ),
    );
  }
}
