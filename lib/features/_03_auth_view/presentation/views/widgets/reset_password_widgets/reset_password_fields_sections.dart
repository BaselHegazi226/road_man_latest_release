import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/password_text_form_field.dart';

import '../sign_up_widgets/check_password_section.dart';

class ResetPasswordFieldsSection extends StatefulWidget {
  const ResetPasswordFieldsSection({
    super.key,
    required this.formKey,
    required this.newPasswordEditingController,
    required this.confirmPasswordEditingController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordEditingController;
  final TextEditingController confirmPasswordEditingController;

  @override
  State<ResetPasswordFieldsSection> createState() =>
      _ResetPasswordFieldsSectionState();
}

class _ResetPasswordFieldsSectionState
    extends State<ResetPasswordFieldsSection> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String? password;
  String? confirmPassword;

  late TextEditingController newPasswordEditingController;
  late TextEditingController confirmPasswordEditingController;

  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  bool containsPassLength = false;
  bool containsSpecialChar = false;
  bool containsNumbers = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;

  @override
  void initState() {
    super.initState();
    newPasswordEditingController = widget.newPasswordEditingController;
    confirmPasswordEditingController = widget.confirmPasswordEditingController;
  }

  void regExpForCheckPasswordVarsFun(String password) {
    // Update password validation status here
    setState(() {
      containsPassLength = password.length >= 8;
      containsSpecialChar = RegExp(r'[^A-Za-z0-9]').hasMatch(password);
      containsNumbers = RegExp(r'\d').hasMatch(password);
      containsUpperCase = RegExp(r'[A-Z]').hasMatch(password);
      containsLowerCase = RegExp(r'[a-z]').hasMatch(password);
    });
  }

  @override
  void dispose() {
    super.dispose();
    newPasswordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: screenHeight * 0.02,
        children: [
          PasswordTextFormField(
            hintText: 'New Password',
            focusNode: passwordFocusNode,
            textEditingController: newPasswordEditingController,
            prefixIcon: Icons.lock_outline,
            obscureText: obscurePassword,
            suffixIcon:
                obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            suffixIconOnPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a password';
              } else if (!RegExp(
                //              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}$',//ده الصح اللي هيكون موجود عندي في التطبيق بعد لما حازم يعدلها عنده
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,}$', // دي المتوافقه مع نسخه حازم اللي هتتعدل بعد كده
              ).hasMatch(value)) {
                return 'Please enter a valid password! (Aa#12345)';
              }
              return null;
            },
            onChanged: (password) {
              regExpForCheckPasswordVarsFun(password);
            },
            onSaved: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          CheckPasswordSection(
            containsPassLength: containsPassLength,
            containsSpecialChar: containsSpecialChar,
            containsNumber: containsNumbers,
            containsUpperCase: containsUpperCase,
            containsLowerCase: containsLowerCase,
          ),
          PasswordTextFormField(
            hintText: 'Confirm Password',
            focusNode: confirmPasswordFocusNode,
            textEditingController: confirmPasswordEditingController,
            prefixIcon: Icons.lock_outline,
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
                return 'Please enter a password';
              } else if (value != newPasswordEditingController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                confirmPassword = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
