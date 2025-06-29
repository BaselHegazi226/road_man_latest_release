import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class JobResponsibilitiesDescItem extends StatelessWidget {
  const JobResponsibilitiesDescItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('●', style: AfacadTextStyles.textStyle20W600Black(context)),

        Expanded(
          child: Text(
            text,
            style: AfacadTextStyles.textStyle14W400Black(
              context,
            ).copyWith(height: 1.5),
          ),
        ),
      ],
    );
  }
}
