import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_password_section.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignUpTextFormFieldSection extends StatefulWidget {
  const SignUpTextFormFieldSection({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignUpTextFormFieldSection> createState() =>
      _SignUpTextFormFieldSectionState();
}

class _SignUpTextFormFieldSectionState
    extends State<SignUpTextFormFieldSection> {
  String? name, email, password;
  String? emailErrorMessage, nameErrorMessage, passwordErrorMessage;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();

  late TextEditingController passwordEditingController;
  late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    fieldsControllerValues();
    focusFun();
    listenerFun();
  }

  void fieldsControllerValues() {
    nameEditingController = widget.nameController;
    emailEditingController = widget.emailController;
    passwordEditingController = widget.passwordController;
  }

  @override
  void dispose() {
    disposeFun();
    removeListenerFun();
    super.dispose();
  }

  void listenerFun() {
    emailEditingController.addListener(onEmailChanged);
    passwordEditingController.addListener(onPasswordChanged);
    nameEditingController.addListener(onNameChanged);
  }

  void removeListenerFun() {
    nameEditingController.removeListener(onEmailChanged);
    passwordEditingController.removeListener(onPasswordChanged);
    emailEditingController.removeListener(onNameChanged);
  }

  // Called when the email is modified
  void onEmailChanged() {
    setState(() {
      emailErrorMessage = null;
    });
  }

  void onPasswordChanged() {
    setState(() {
      passwordErrorMessage = null;
    });
  }

  void onNameChanged() {
    setState(() {
      nameErrorMessage = null;
    });
  }

  void clearFun() {
    nameEditingController.clear();
    emailEditingController.clear();
    passwordEditingController.clear();
  }

  void focusFun() {
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    nameFocusNode.addListener(() {
      setState(() {});
    });
  }

  void disposeFun() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    nameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Form(
      key: widget.formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        spacing: screenHeight * 0.02,
        children: [
          CustomTextFormField(
            hintText: 'Name',
            focusNode: nameFocusNode,
            textEditingController: nameEditingController,
            prefixIcon: Icons.person_2_outlined,
            validator: (name) {
              String? trimmedValue = name?.trim();
              if (trimmedValue == null || trimmedValue.isEmpty) {
                return 'Please enter a name';
              }
              if (trimmedValue.length < 8) {
                return 'Enter at least 8 letters';
              }
              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmedValue)) {
                return 'Enter a valid name (letters only)';
              }
              return null;
            },
            onSaved: (newValue) {
              name = newValue;
            },
          ),
          CustomTextFormField(
            hintText: 'Email',
            focusNode: emailFocusNode,
            textEditingController: emailEditingController,
            prefixIcon: Icons.email_outlined,
            validator: (email) {
              String? trimmedValue = email?.trim();
              if (trimmedValue == null || trimmedValue.isEmpty) {
                return 'Please enter an email';
              } else if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(trimmedValue)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (newValue) {
              email = newValue;
            },
          ),
          SignUpPasswordSection(
            passwordEditingController: widget.passwordController,
            passwordFocusNode: passwordFocusNode,
          ),
        ],
      ),
    );
  }
}
