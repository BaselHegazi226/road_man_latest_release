import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/const_variables.dart';

class RecentJobsItem extends StatefulWidget {
  const RecentJobsItem({super.key, required this.text});
  final String text;

  @override
  State<RecentJobsItem> createState() => _RecentJobsItemState();
}

class _RecentJobsItemState extends State<RecentJobsItem> {
  Color backgroundColor = const Color(0xffE6E8EE);
  Color textColor = kTextBlackPrimaryColor;
  bool isActiveButton = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.05, // ارتفاع متناسب مع الشاشة
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          screenWidth * 0.02,
        ), // تناسب مع العرض
        color: !isActiveButton ? backgroundColor : kAppPrimaryBlueColor,
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            isActiveButton = !isActiveButton;
          });
        },
        child: Text(
          widget.text,
          style: AfacadTextStyles.textStyle16W600Black(context).copyWith(
            color:
                !isActiveButton
                    ? kTextBlackPrimaryColor
                    : kAppPrimaryWhiteColor,
          ),
        ),
      ),
    );
  }
}
