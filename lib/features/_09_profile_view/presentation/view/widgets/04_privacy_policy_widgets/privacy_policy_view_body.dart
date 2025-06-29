import 'package:flutter/material.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/04_privacy_policy_widgets/privacy_policy_items_section.dart';

import '../00_profile_common_widgets/custom_profile_blue_text_button.dart';
import '../00_profile_common_widgets/custom_profile_title.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: Column(
        spacing: screenHeight * .02,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomProfileTitle(
            title: 'Protecting your data is our priority',
          ),
          const PrivacyPolicyItemsSection(),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .06),
            child: CustomProfileBlueTextButton(
              text: 'I agree to the privacy policy',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
