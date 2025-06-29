import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import 'learning_preferences_card_list_section.dart';

class LearningPreferencesViewBody extends StatelessWidget {
  const LearningPreferencesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * .04),
      child: CustomScrollView(
        slivers: [
          const LearningPreferenceItemsListSection(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextButton(
                  onPressed: () {},
                  backgroundColor: kAppPrimaryBlueColor,
                  child: CustomTitle(title: 'Change'),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
