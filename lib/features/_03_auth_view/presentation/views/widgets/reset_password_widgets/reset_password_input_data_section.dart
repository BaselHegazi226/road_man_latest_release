import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/reset_password_widgets/reset_password_button.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/reset_password_widgets/reset_password_fields_sections.dart';

class ResetPasswordInputDataSection extends StatefulWidget {
  const ResetPasswordInputDataSection({super.key, required this.emailAndOtp});
  final Map<String, dynamic> emailAndOtp;

  @override
  State<ResetPasswordInputDataSection> createState() =>
      _ResetPasswordInputDataSectionState();
}

class _ResetPasswordInputDataSectionState
    extends State<ResetPasswordInputDataSection> {
  TextEditingController newPasswordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      spacing: screenHeight * .02,
      children: [
        ResetPasswordFieldsSection(
          formKey: _formKey,
          newPasswordEditingController: newPasswordEditingController,
          confirmPasswordEditingController: confirmPasswordEditingController,
        ),
        ResetPasswordButton(
          screenHeight: screenHeight,
          formKey: _formKey,
          resetPasswordInputDataSectionWidget: widget,
          newPasswordEditingController: newPasswordEditingController,
          confirmPasswordEditingController: confirmPasswordEditingController,
        ),
      ],
    );
  }
}
