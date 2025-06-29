import 'package:flutter/cupertino.dart';

import '../../../../../_03_auth_view/presentation/views/widgets/sign_up_widgets/check_password_section.dart';
import 'custom_edit_profile_password_field.dart';

class EditProfilePasswordFieldsSection extends StatefulWidget {
  const EditProfilePasswordFieldsSection({
    super.key,
    required this.formKey,
    required this.currentPasswordEditingController,
    required this.newPasswordEditingController,
    required this.confirmPasswordEditingController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController currentPasswordEditingController;
  final TextEditingController newPasswordEditingController;
  final TextEditingController confirmPasswordEditingController;

  @override
  State<EditProfilePasswordFieldsSection> createState() =>
      _EditProfilePasswordFieldsSectionState();
}

class _EditProfilePasswordFieldsSectionState
    extends State<EditProfilePasswordFieldsSection> {
  final FocusNode currentPasswordFocusNode = FocusNode();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  bool obscureCurrentPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  String? password;
  String? confirmPassword;

  bool containsPassLength = false;
  bool containsSpecialChar = false;
  bool containsNumbers = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;

  void regExpForCheckPasswordVarsFun(String value) {
    setState(() {
      containsPassLength = value.length >= 8;
      containsSpecialChar = RegExp(r'[^A-Za-z0-9]').hasMatch(value);
      containsNumbers = RegExp(r'\d').hasMatch(value);
      containsUpperCase = RegExp(r'[A-Z]').hasMatch(value);
      containsLowerCase = RegExp(r'[a-z]').hasMatch(value);
    });
  }

  @override
  void dispose() {
    currentPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Form(
      key: widget.formKey,
      child: Column(
        spacing: screenHeight * 0.02,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomEditProfilePasswordField(
            focusNode: currentPasswordFocusNode,
            textEditingController: widget.currentPasswordEditingController,
            labelText: 'Current password',
            obscureText: obscureCurrentPassword,
            suffixIcon:
                obscureCurrentPassword
                    ? CupertinoIcons.eye_slash
                    : CupertinoIcons.eye,
            suffixIconOnPressed: () {
              setState(() {
                obscureCurrentPassword = !obscureCurrentPassword;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your current password';
              }
              return null;
            },
          ),
          CustomEditProfilePasswordField(
            focusNode: newPasswordFocusNode,
            textEditingController: widget.newPasswordEditingController,
            labelText: 'New password',
            obscureText: obscureNewPassword,
            suffixIcon:
                obscureNewPassword
                    ? CupertinoIcons.eye_slash
                    : CupertinoIcons.eye,
            suffixIconOnPressed: () {
              setState(() {
                obscureNewPassword = !obscureNewPassword;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              } else if (!RegExp(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,}$',
              ).hasMatch(value)) {
                return 'Please enter a valid password! (Aa#12345)';
              }
              return null;
            },
            onChanged: (value) {
              regExpForCheckPasswordVarsFun(value);
            },
            onSaved: (value) => password = value,
          ),
          CheckPasswordSection(
            containsPassLength: containsPassLength,
            containsSpecialChar: containsSpecialChar,
            containsNumber: containsNumbers,
            containsUpperCase: containsUpperCase,
            containsLowerCase: containsLowerCase,
          ),
          CustomEditProfilePasswordField(
            focusNode: confirmPasswordFocusNode,
            textEditingController: widget.confirmPasswordEditingController,
            labelText: 'Confirm password',
            obscureText: obscureConfirmPassword,
            suffixIcon:
                obscureConfirmPassword
                    ? CupertinoIcons.eye_slash
                    : CupertinoIcons.eye,
            suffixIconOnPressed: () {
              setState(() {
                obscureConfirmPassword = !obscureConfirmPassword;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              } else if (value != widget.newPasswordEditingController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            onSaved: (value) => confirmPassword = value,
          ),
        ],
      ),
    );
  }
}
