import 'package:flutter/material.dart';

import '../../../../data/models/profile/faq_item_model.dart';
import '../00_profile_common_widgets/custom_title_subtitle.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({super.key, required this.faqItemModel});
  final FaqItemModel faqItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomTitleSubtitle(
      title: faqItemModel.title,
      subTitle: faqItemModel.subTitle,
    );
  }
}
