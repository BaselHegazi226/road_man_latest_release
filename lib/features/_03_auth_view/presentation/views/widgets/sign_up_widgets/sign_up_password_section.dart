import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/password_text_form_field.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/check_password_section.dart';

class SignUpPasswordSection extends StatefulWidget {
  const SignUpPasswordSection({
    super.key,
    required this.passwordEditingController,
    required this.passwordFocusNode,
  });

  final TextEditingController passwordEditingController;
  final FocusNode passwordFocusNode;

  @override
  State<SignUpPasswordSection> createState() => _SignUpPasswordSectionState();
}

class _SignUpPasswordSectionState extends State<SignUpPasswordSection> {
  bool obscurePassword = true;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsSpecialChar = false;
  bool containsNumbers = false;
  bool containsPassLength = false;

  String? password;

  @override
  void initState() {
    super.initState();
    widget.passwordFocusNode.addListener(() {
      setState(() {}); // لتحديث الحالة عند الفوكس
    });
  }

  @override
  void dispose() {
    // لا تفعل dispose للـ FocusNode لأنه جاي من parent
    super.dispose();
  }

  void regExpForCheckPasswordVarsFun(String value) {
    setState(() {
      containsLowerCase = RegExp(r'(?=.*[a-z])').hasMatch(value);
      containsUpperCase = RegExp(r'(?=.*[A-Z])').hasMatch(value);
      containsNumbers = RegExp(r'(?=.*\d)').hasMatch(value);
      containsSpecialChar = RegExp(r'[^a-zA-Z0-9\s]').hasMatch(value);
      containsPassLength = RegExp(r'.{8,}').hasMatch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      spacing: screenHeight * 0.02,
      children: [
        PasswordTextFormField(
          hintText: 'Password',
          focusNode: widget.passwordFocusNode,
          textEditingController: widget.passwordEditingController,
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
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            } else if (!RegExp(
              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,}$',
            ).hasMatch(value)) {
              return 'Please enter a valid password! (Aa#12345)';
            }
            return null;
          },
          onChanged: regExpForCheckPasswordVarsFun,
          onSaved: (value) {
            password = value;
          },
        ),
        CheckPasswordSection(
          containsPassLength: containsPassLength,
          containsSpecialChar: containsSpecialChar,
          containsNumber: containsNumbers,
          containsUpperCase: containsUpperCase,
          containsLowerCase: containsLowerCase,
        ),
      ],
    );
  }
}
