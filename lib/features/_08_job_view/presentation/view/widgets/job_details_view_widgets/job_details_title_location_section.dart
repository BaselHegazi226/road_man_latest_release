import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class JobDetailsTitleLocationSection extends StatelessWidget {
  const JobDetailsTitleLocationSection({
    super.key,
    required this.title,
    required this.company,
    required this.location,
  });
  final String title, company, location;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      children: [
        Text(title, style: AfacadTextStyles.textStyle20W600Black(context)),
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(company, style: AfacadTextStyles.textStyle16W400Grey(context)),
            Text(
              location,
              style: AfacadTextStyles.textStyle16W400Grey(context),
            ),
          ],
        ),
      ],
    );
  }
}
