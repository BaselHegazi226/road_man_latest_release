import 'package:flutter/material.dart';

import '../../../../data/models/profile/key_features_item_model.dart';
import 'key_features_item.dart';

class KeyFeatureItemsSection extends StatelessWidget {
  const KeyFeatureItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<KeyFeaturesItemModel> keyFeaturesItemModelList = [
      KeyFeaturesItemModel(title: 'Personalized Learning Recommendations'),
      KeyFeaturesItemModel(title: 'Assessment tests after each level'),
      KeyFeaturesItemModel(title: 'Job suggestions based on your skills'),
      KeyFeaturesItemModel(
        title: 'Notifications for reminders and required skills',
      ),
    ];
    return Column(
      children: List.generate(
        keyFeaturesItemModelList.length,
        (index) => KeyFeaturesItem(
          keyFeaturesItemModel: keyFeaturesItemModelList[index],
        ),
      ),
    );
  }
}
