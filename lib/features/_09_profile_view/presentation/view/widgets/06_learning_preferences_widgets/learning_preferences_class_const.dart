import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../data/models/learning_preferences_model/learning_preferences_item_model.dart';

class LearningPreferencesClassConst {
  static const List<LearningPreferencesItemModel>
  learningPreferencesItemModelList = [
    LearningPreferencesItemModel(
      title: 'Select The Field',
      cardText: 'Card Field',
      iconData: Icons.local_library_outlined,
    ),
    LearningPreferencesItemModel(
      title: 'Learning method',
      cardText: 'Card Field',
      iconData: Icons.work_history_outlined,
    ),
    LearningPreferencesItemModel(
      title: 'Level settings',
      cardText: 'Card Field',
      iconData: FontAwesomeIcons.stairs,
    ),
    LearningPreferencesItemModel(
      title: 'Select The Field',
      cardText: 'Card Field',
      iconData: Icons.local_library_outlined,
    ),
    LearningPreferencesItemModel(
      title: 'Learning method',
      cardText: 'Card Field',
      iconData: Icons.work_history_outlined,
    ),
    LearningPreferencesItemModel(
      title: 'Level settings',
      cardText: 'Card Field',
      iconData: FontAwesomeIcons.stairs,
    ),
  ];
}
