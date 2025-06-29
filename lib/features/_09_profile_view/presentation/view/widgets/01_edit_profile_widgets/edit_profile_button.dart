import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {},
      backgroundColor: kAppPrimaryBlueColor,
      child: CustomTitle(title: 'Update Profile'),
    );
  }
}
