import 'package:flutter/material.dart';

import '../00_profile_common_widgets/custom_advanced_switch.dart';
import '../00_profile_common_widgets/custom_profile_title.dart';

class CustomTitleSwitch extends StatelessWidget {
  const CustomTitleSwitch({
    super.key,
    required this.title,
    required this.onChanged,
  });
  final String title;
  final void Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomProfileTitle(title: title),
          CustomAdvancedSwitch(onChanged: onChanged),
        ],
      ),
    );
  }
}
