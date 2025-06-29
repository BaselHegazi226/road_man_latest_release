import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/forget_password_widgets/forget_password_fields_section.dart';

import 'forget_password_button.dart';

class ForgetPasswordInputDataSection extends StatefulWidget {
  const ForgetPasswordInputDataSection({super.key});

  @override
  State<ForgetPasswordInputDataSection> createState() =>
      _ForgetPasswordInputDataSectionState();
}

class _ForgetPasswordInputDataSectionState
    extends State<ForgetPasswordInputDataSection> {
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
          ForgetPasswordFieldsSection(
            emailEditingController: emailEditingController,
          ),
          ForgetPasswordButton(
            screenHeight: screenHeight,
            formKey: _formKey,
            emailEditingController: emailEditingController,
          ),
        ],
      ),
    );
  }
}
