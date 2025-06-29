import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomSettingsContainer extends StatelessWidget {
  const CustomSettingsContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 48,
      decoration: BoxDecoration(
        color: kSettingsContainerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
