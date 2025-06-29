import 'package:flutter/material.dart';

import '../00_profile_common_widgets/custom_profile_blue_text_button.dart';
import 'faq_items_section.dart';

class FaqViewBody extends StatelessWidget {
  const FaqViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .04,
        vertical: screenHeight * .04,
      ),
      child: Column(
        spacing: screenHeight * .0675,
        children: [
          const FaqItemsSection(),
          CustomProfileBlueTextButton(text: 'Contact us', onPressed: () {}),
        ],
      ),
    );
  }
}
