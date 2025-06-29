import 'package:flutter/material.dart';

import 'custom_setting_form_field.dart';

class SettingsFormFieldsSection extends StatelessWidget {
  const SettingsFormFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CustomSettingFormField(
          hintText: 'Select the field',
          textEditingController: TextEditingController(),
        ),
        CustomSettingFormField(
          hintText: 'Learning method',
          textEditingController: TextEditingController(),
        ),
        CustomSettingFormField(
          hintText: 'Level settings',
          textEditingController: TextEditingController(),
        ),
      ],
    );
  }
}
