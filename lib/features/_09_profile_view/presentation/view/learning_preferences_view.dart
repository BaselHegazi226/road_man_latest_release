import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/06_learning_preferences_widgets/learning_preferences_view_body.dart';

import '../../../../core/utilities/custom_app_bar.dart';

class LearningPreferencesView extends StatelessWidget {
  const LearningPreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      extendBodyBehindAppBar: false,
      appBar: customAppBar(
        context,
        text: 'Learning Preferences',
        onPressed: () {
          GoRouter.of(context).pop();
        },
        backgroundColor: kAppPrimaryWhiteColor,
      ),
      body: SafeArea(child: const LearningPreferencesViewBody()),
    );
  }
}
