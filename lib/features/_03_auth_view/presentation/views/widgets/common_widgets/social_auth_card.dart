import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class SocialAuthCard extends StatelessWidget {
  const SocialAuthCard({
    super.key,
    required this.widget,
    required this.onPressed,
  });
  final Widget widget;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenWidth,
        height: screenHeight * .0625, //54
        decoration: BoxDecoration(
          color: kSecondlyLightWhiteColor,
          border: Border.all(color: kAppPrimaryBlueColor),
          borderRadius: BorderRadius.circular(screenWidth * .02),
          boxShadow: [
            BoxShadow(
              color: kSocialCardShadowColor,
              offset: Offset(4, 4),
              blurRadius: 8,
              spreadRadius: -4,
            ),
            BoxShadow(
              color: kSocialCardShadow2Color,
              offset: Offset(2, 4),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * .02,
            vertical: screenHeight * .005,
          ),
          child: widget,
        ),
      ),
    );
  }
}
