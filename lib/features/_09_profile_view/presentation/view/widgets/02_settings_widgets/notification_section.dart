import 'package:flutter/material.dart';

import 'custom_icon_title.dart';
import 'custom_settings_container.dart';
import 'custom_title_switch.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomIconTitle(
          iconData: Icons.notifications_outlined,
          title: 'Notification',
        ),
        CustomSettingsContainer(
          child: CustomTitleSwitch(
            title: 'Turn on/off notifications',
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
