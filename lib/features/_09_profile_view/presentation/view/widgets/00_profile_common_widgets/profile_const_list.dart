import 'package:flutter/material.dart';

import '../../../../../../core/utilities/routes.dart';
import '../../../../data/models/profile/edit_profile_container_item_model.dart';
import '../../../../data/models/profile/faq_item_model.dart';
import '../../../../data/models/profile/privacy_policy_item_model.dart';
import '../../../../data/models/profile/profile_item_model.dart';

class ProfileConstList {
  static const List<FaqItemModel> faqItemModelList = [
    FaqItemModel(
      title: 'How can I modify my learning path?',
      subTitle:
          'You can modify your path through “Learning Preferences” in Settings, where you can change the field, level, and learning method.',
    ),
    FaqItemModel(
      title: 'How does the app suggest suitable jobs for me?',
      subTitle:
          ' Your skills and educational progress are analyzed, and then your data is matched with available jobs in the labor market.',
    ),
    FaqItemModel(
      title: 'Is the app free?',
      subTitle:
          ' The app is available for free, but there are some additional paid features.',
    ),
    FaqItemModel(
      title: 'How do I get test reminder notifications?',
      subTitle:
          ' You can activate AI notifications through the notification settings within the app.',
    ),
  ];
  static const List<PrivacyPolicyItemModel> privacyPolicyItemModelList = [
    PrivacyPolicyItemModel(
      title: 'What data do we collect?',
      subTitle:
          'Account information (name, email, country) Your educational progress and the skills you acquire Data about your interaction with educational content',
    ),
    PrivacyPolicyItemModel(
      title: 'How do we use your data?',
      subTitle:
          'Personalize the educational experience and provide personalized recommendations. Send notifications and reminders related to your progress. Improve the performance of the application based on your usage.',
    ),
    PrivacyPolicyItemModel(
      title: 'Do we share your data with third parties?',
      subTitle:
          'We do not sell your data to any third party. Data is only shared with service providers when needed, such as performance analysis services.',
    ),
    PrivacyPolicyItemModel(
      title: 'How can you control your data?',
      subTitle:
          'You can modify your data or delete your account through the settings. You can request to permanently delete your data by contacting technical support.',
    ),
    PrivacyPolicyItemModel(
      title: '️Security and Protection?',
      subTitle:
          'We use encryption technologies to protect your data from any breach.',
    ),
  ];
  static const List<EditProfileContainerItemModel>
  editProfileContainerItemModelList = [
    EditProfileContainerItemModel(
      title: 'Full Name',
      subTitle: 'Ahmed Ali',
      iconData: Icons.person_outline_outlined,
    ),
    EditProfileContainerItemModel(
      title: 'Email',
      subTitle: 'ahmedali123@gmail.com',
      iconData: Icons.email_outlined,
    ),
  ];

  static final List<ProfileItemModel> profileItemModelList = [
    ProfileItemModel(
      prefixIcon: Icons.edit,
      title: 'Edit Profile',
      routeName: Routes.editProfileViewId,
    ),
    ProfileItemModel(
      prefixIcon: Icons.settings,
      title: 'Settings',
      routeName: Routes.settingsViewId,
    ),
    ProfileItemModel(
      prefixIcon: Icons.local_library_outlined,
      title: 'Learning Preferences',
      routeName: Routes.learningPreferencesViewId,
    ),
    ProfileItemModel(
      prefixIcon: Icons.info_outline_rounded,
      title: 'About App',
      routeName: Routes.aboutAppViewId,
    ),
    ProfileItemModel(
      prefixIcon: Icons.privacy_tip_outlined,
      title: 'Privacy Policy',
      routeName: Routes.privacyPolicyViewId,
    ),
    ProfileItemModel(
      prefixIcon: Icons.help_outline_outlined,
      title: 'FAQ',
      routeName: Routes.faqViewId,
    ),
  ];
}
