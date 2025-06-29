import 'package:flutter/material.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/08_profile_forget_password_widgets/profile_forget_password_fields_section.dart';

import 'profile_forget_password_button.dart';

class ProfileForgetPasswordInputDataSection extends StatefulWidget {
  const ProfileForgetPasswordInputDataSection({super.key});

  @override
  State<ProfileForgetPasswordInputDataSection> createState() =>
      _ProfileForgetPasswordInputDataSectionState();
}

class _ProfileForgetPasswordInputDataSectionState
    extends State<ProfileForgetPasswordInputDataSection> {
  final TextEditingController emailEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Form(
      key: _formKey,
      child: Column(
        spacing: screenHeight * .03,
        children: [
          ProfileForgetPasswordFieldsSection(
            emailEditingController: emailEditingController,
          ),
          ProfileForgetPasswordButton(
            screenHeight: screenHeight,
            formKey: _formKey,
            emailEditingController: emailEditingController,
          ),
        ],
      ),
    );
  }
}
