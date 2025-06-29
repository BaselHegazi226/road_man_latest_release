import 'package:flutter/material.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/04_privacy_policy_widgets/privacy_policy_item.dart';

import '../00_profile_common_widgets/profile_const_list.dart';

class PrivacyPolicyItemsSection extends StatelessWidget {
  const PrivacyPolicyItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children:
          ProfileConstList.privacyPolicyItemModelList
              .map((item) => PrivacyPolicyItem(privacyPolicyItemModel: item))
              .toList(),
    );
  }
}
