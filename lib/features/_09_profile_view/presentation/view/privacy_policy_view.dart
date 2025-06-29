import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/04_privacy_policy_widgets/privacy_policy_view_body.dart';

import '../../../../core/helper/const_variables.dart';
import '../../../../core/utilities/custom_app_bar.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        context,
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextBlackPrimaryColor,
        text: 'Privacy Policy',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const PrivacyPolicyViewBody(),
    );
  }
}
