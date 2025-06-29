import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomAdvancedSwitch extends StatefulWidget {
  const CustomAdvancedSwitch({super.key, required this.onChanged});
  final void Function(dynamic)? onChanged;
  @override
  State<CustomAdvancedSwitch> createState() => _CustomAdvancedSwitchState();
}

class _CustomAdvancedSwitchState extends State<CustomAdvancedSwitch> {
  final ValueNotifier<bool> _controller = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      onChanged: widget.onChanged,
      controller: _controller,
      activeColor: kSettingsSwitchActiveColor,
      inactiveColor: kSettingsSwitchInActiveColor,
      borderRadius: BorderRadius.all(const Radius.circular(16)),
      width: 52.0,
      height: 24.0,
      enabled: true,
      disabledOpacity: 0.5,
      thumb: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: kSettingsSwitchInactiveThumbColor, // Thumb color
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
