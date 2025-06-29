import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';


class SearchBarSectionIcon extends StatelessWidget {
  const SearchBarSectionIcon({super.key, required this.iconData});
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.12, // 12% of screen width
      height: screenHeight * 0.07, // Match container height
      decoration: BoxDecoration(
        color: kAppPrimaryBlueColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Icon(
        iconData,
        color: kAppPrimaryWhiteColor,
        size: screenWidth * 0.06, // Responsive icon size
      ),
    );
  }
}
