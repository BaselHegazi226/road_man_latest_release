import 'package:flutter/material.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/02_settings_widgets/settings_form_fields_section.dart';

import 'custom_icon_title.dart';

class LearningPreferencesSections extends StatelessWidget {
  const LearningPreferencesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: MediaQuery.sizeOf(context).height * .02,
      children: [
        CustomIconTitle(
          iconData: Icons.local_library_outlined,
          title: 'Learning preferences',
        ),
        SettingsFormFieldsSection(),
      ],
    );
  }
}
