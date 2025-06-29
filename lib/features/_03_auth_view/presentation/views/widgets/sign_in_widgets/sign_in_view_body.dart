import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/auth_image_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_component_section.dart';

import '../../../../../../core/helper/Assets.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AuthImageSection(image: kLoginImage),
        SignInComponentSection(),
      ],
    );
  }
}
