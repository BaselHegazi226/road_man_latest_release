import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_me_card.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: screenWidth * 0.02,
      children: [
        RememberMeCard(),
        Text(
          maxLines: 1,
          'Remember me',
          style: AfacadTextStyles.textStyle14W400Black(
            context,
          ).copyWith(letterSpacing: -.266, height: 1.5),
        ),
      ],
    );
  }
}
