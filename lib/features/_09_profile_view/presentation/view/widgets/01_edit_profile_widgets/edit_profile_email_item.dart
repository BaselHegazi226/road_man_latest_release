import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/class_const_functions.dart';
import '../../../../../../core/helper/const_variables.dart';

class EditProfileEmailItem extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final Color underlineColor;
  final Color fullColor;
  final Color shadowColor;
  final String email;

  const EditProfileEmailItem({
    super.key,
    required this.hintText,
    this.prefixIcon = Icons.key_outlined,
    this.underlineColor = kEditProfileFieldBorderColor,
    this.fullColor = kEditProfileContainer3Color,
    this.shadowColor = Colors.transparent,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: screenHeight * .08,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .04,
        vertical: screenWidth * .015,
      ),
      decoration: BoxDecoration(
        color: fullColor,
        borderRadius: BorderRadius.circular(screenWidth * .02),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        spacing: screenWidth * .03,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: screenWidth * .03,
            children: [
              Icon(
                Icons.email_outlined,
                size: screenWidth * .06,
                color: kEditProfileIconColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * .01),
                child: Container(
                  width: screenWidth * .005,
                  color: kEditProfileDividerColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: screenHeight * .0025,
                children: [
                  Text(
                    'Email',
                    style: AfacadTextStyles.textStyle16W600H150Black(
                      context,
                    ).copyWith(color: kEditProfileTitleColor),
                  ),
                  Text(
                    email,
                    style: ConstFunctions.editProfileTextStyle(context),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.edit_off_outlined,
            color: kEditProfileTitleColor,
            size: screenWidth * .06,
          ),
        ],
      ),
    );
  }
}
