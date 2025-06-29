import 'package:flutter/material.dart';

import '../../../../data/models/profile/privacy_policy_item_model.dart';
import '../00_profile_common_widgets/custom_title_subtitle.dart';

class PrivacyPolicyItem extends StatelessWidget {
  const PrivacyPolicyItem({super.key, required this.privacyPolicyItemModel});
  final PrivacyPolicyItemModel privacyPolicyItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomTitleSubtitle(
      title: privacyPolicyItemModel.title,
      subTitle: privacyPolicyItemModel.subTitle,
    );
  }
}
