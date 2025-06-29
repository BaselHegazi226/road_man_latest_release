import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/const_variables.dart';

class WorkingTimeItem extends StatelessWidget {
  const WorkingTimeItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth * 0.08, // نسبة من عرض الشاشة لجعلها مرنة
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
      ), // تناسب العرض
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: kTextBlackPrimaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AfacadTextStyles.textStyle14W400Black(
            context,
          ).copyWith(color: kTextBlackPrimaryColor),
        ),
      ),
    );
  }
}
