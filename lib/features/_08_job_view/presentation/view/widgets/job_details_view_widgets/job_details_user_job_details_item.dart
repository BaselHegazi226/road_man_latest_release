import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class JobDetailsUserJobDetailsItem extends StatelessWidget {
  const JobDetailsUserJobDetailsItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.subTitle,
  });
  final IconData iconData;
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: Color(0xffE6E8EE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kSecondlyLightWhiteColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  //jobDetailsUserJobDetailsItemModel.iconData,
                  iconData,
                  color: kAppPrimaryBlueColor,
                  //size: jobDetailsUserJobDetailsItemModel.iconSize,
                  size: 24,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: [
                Text(
                  title,
                  style: AfacadTextStyles.textStyle14W400Black(context),
                ),
                Text(
                  subTitle,
                  style: AfacadTextStyles.textStyle14W400Blue(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
