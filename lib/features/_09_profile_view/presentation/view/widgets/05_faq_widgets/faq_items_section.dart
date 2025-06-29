import 'package:flutter/material.dart';

import '../00_profile_common_widgets/profile_const_list.dart';
import 'faq_item.dart';

class FaqItemsSection extends StatelessWidget {
  const FaqItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      spacing: screenHeight * .03,
      children:
          ProfileConstList.faqItemModelList
              .map((item) => FaqItem(faqItemModel: item))
              .toList(),
    );
  }
}
