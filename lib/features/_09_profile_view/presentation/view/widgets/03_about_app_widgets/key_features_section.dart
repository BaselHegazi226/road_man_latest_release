import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import 'key_feature_items_section.dart';

class KeyFeaturesSection extends StatelessWidget {
  const KeyFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Key Features',
          style: AfacadTextStyles.textStyle16W700Black(context),
        ),
        KeyFeatureItemsSection(),
      ],
    );
  }
}
