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
      width: screenWidth,
      height: screenHeight * .11, // زوّدنا الارتفاع شوية
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .04,
        vertical: screenWidth * .02,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.email_outlined,
            size: screenWidth * .06,
            color: kEditProfileIconColor,
          ),
          SizedBox(width: screenWidth * .03),
          Container(
            width: screenWidth * .005,
            height: double.infinity,
            color: kEditProfileDividerColor,
          ),
          SizedBox(width: screenWidth * .03),
          // ✅ Expanded علشان يتسع حسب الحاجة
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Email',
                  style: AfacadTextStyles.textStyle16W600H150Black(
                    context,
                  ).copyWith(color: kEditProfileTitleColor),
                ),
                SizedBox(height: screenHeight * .004),
                Text(
                  email,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ConstFunctions.editProfileTextStyle(context),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * .02),
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
