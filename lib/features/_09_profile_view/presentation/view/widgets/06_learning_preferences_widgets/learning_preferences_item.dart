import 'package:flutter/material.dart';

import '../02_settings_widgets/custom_icon_title.dart';
import 'learning_preferences_card.dart';

class LearningPreferencesItem extends StatelessWidget {
  const LearningPreferencesItem({
    super.key,
    required this.title,
    required this.cardText,
    required this.iconData,
  });
  final String title, cardText;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      spacing: screenSize.height * .02,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconTitle(iconData: iconData, title: title),
        LearningPreferencesCard(screenSize: screenSize, cardText: cardText),
      ],
    );
  }
}
