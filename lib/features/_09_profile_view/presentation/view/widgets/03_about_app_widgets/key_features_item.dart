import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../data/models/profile/key_features_item_model.dart';

class KeyFeaturesItem extends StatelessWidget {
  const KeyFeaturesItem({super.key, required this.keyFeaturesItemModel});
  final KeyFeaturesItemModel keyFeaturesItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Icon(
          keyFeaturesItemModel.iconData,
          size: 24,
          color: kAppPrimaryBlueColor,
        ),
        Text(
          maxLines: 1,
          keyFeaturesItemModel.title,
          style: TextStyle(
            color: kTextBlackPrimaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
