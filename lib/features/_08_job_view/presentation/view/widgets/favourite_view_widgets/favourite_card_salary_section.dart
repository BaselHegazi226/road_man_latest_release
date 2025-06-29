import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class FavouriteCardSalarySection extends StatelessWidget {
  const FavouriteCardSalarySection({
    super.key,
    required this.salary,
    required this.jobType,
  });
  final String salary;
  final String jobType;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text(salary, style: AfacadTextStyles.textStyle14W400Grey(context)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
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
