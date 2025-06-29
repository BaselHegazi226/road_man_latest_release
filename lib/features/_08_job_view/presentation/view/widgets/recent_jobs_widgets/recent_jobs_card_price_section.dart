import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class RecentJobsCardPriceSection extends StatelessWidget {
  final String salary;
  final String jobType;

  const RecentJobsCardPriceSection({
    super.key,
    required this.salary,
    required this.jobType,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      spacing: screenWidth * 0.02,
      children: [
        Text(salary, style: AfacadTextStyles.textStyle14W400Grey(context)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.005,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            border: Border.all(color: const Color(0xff8A8C90), width: 1.5),
          ),
          child: Text(
            jobType,
            style: AfacadTextStyles.textStyle14W400Black(context),
          ),
        ),
      ],
    );
  }
}
