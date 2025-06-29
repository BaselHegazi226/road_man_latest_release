import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';

import 'customize_notification_section.dart';
import 'notification_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * .04,
        right: screenWidth * .04,
        top: screenHeight * .04,
      ),
      child: CustomFlexibleWidget(
        child: Column(
          spacing: screenHeight * .03,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const LearningPreferencesSections(),
            const NotificationSection(),
            const CustomizeNotificationSection(),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * .03),
              child: CustomTextButton(
                onPressed: () {},
                backgroundColor: kAppPrimaryBlueColor,
                child: CustomTitle(title: 'Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
