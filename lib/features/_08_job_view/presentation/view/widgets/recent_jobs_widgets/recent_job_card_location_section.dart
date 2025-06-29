import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/const_variables.dart';

class RecentJobCardLocationSection extends StatelessWidget {
  final String company;
  final String location;
  final String timeLeft;

  const RecentJobCardLocationSection({
    super.key,
    required this.company,
    required this.location,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: screenWidth * 0.04,
          children: [
            Container(
              width: screenWidth * 0.08, // 8% من عرض الشاشة
              height: screenWidth * 0.08,
              decoration: BoxDecoration(
                color: kAppPrimaryBlueColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
              child: Icon(
                FontAwesomeIcons.linkedinIn,
                color: kAppPrimaryWhiteColor,
                size: screenWidth * 0.05, // 5% من عرض الشاشة
              ),
            ),
            // بدل spacing: 16
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: screenHeight * 0.002,
              children: [
                Text(
                  company,
                  style: AfacadTextStyles.textStyle14W400Grey(context),
                ),
                Text(
                  location,
                  style: AfacadTextStyles.textStyle14W400Grey(context),
                ),
              ],
            ),
          ],
        ),
        Text(timeLeft, style: AfacadTextStyles.textStyle12W400Grey(context)),
      ],
    );
  }
}
