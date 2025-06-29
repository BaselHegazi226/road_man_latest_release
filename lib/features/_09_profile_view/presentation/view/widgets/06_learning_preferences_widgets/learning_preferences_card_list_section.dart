import 'package:flutter/material.dart';

import 'learning_preferences_class_const.dart';
import 'learning_preferences_item.dart';

class LearningPreferenceItemsListSection extends StatelessWidget {
  const LearningPreferenceItemsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    final list = LearningPreferencesClassConst.learningPreferencesItemModelList;

    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * .02),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = list[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: screenSize.height * .015),
            child: LearningPreferencesItem(
              title: item.title,
              cardText: item.cardText,
              iconData: item.iconData,
            ),
          );
        }, childCount: list.length),
      ),
    );
  }
}
