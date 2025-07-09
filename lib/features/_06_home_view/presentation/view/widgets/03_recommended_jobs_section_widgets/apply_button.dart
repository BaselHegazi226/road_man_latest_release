import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * .02,
          vertical: screenSize.height * .005,
        ),
        decoration: BoxDecoration(
          color: kAppPrimaryBlueColor,
          borderRadius: BorderRadius.circular(screenSize.width * .02),
        ),
        child: Text(
          'Apply Now',
          style: AfacadTextStyles.textStyle14W400Black(
            context,
          ).copyWith(color: kAppPrimaryWhiteColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
