import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/05_faq_widgets/faq_view_body.dart';

import '../../../../core/helper/const_variables.dart';
import '../../../../core/utilities/custom_app_bar.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        context,
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextBlackPrimaryColor,
        text: 'FAQ',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const FaqViewBody(),
    );
  }
}
