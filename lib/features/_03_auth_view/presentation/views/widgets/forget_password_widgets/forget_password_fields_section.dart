import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';

class ForgetPasswordFieldsSection extends StatefulWidget {
  const ForgetPasswordFieldsSection({
    super.key,
    required this.emailEditingController,
  });
  final TextEditingController emailEditingController;
  @override
  State<ForgetPasswordFieldsSection> createState() =>
      _ForgetPasswordFieldsSectionState();
}

class _ForgetPasswordFieldsSectionState
    extends State<ForgetPasswordFieldsSection> {
  String? email;
  String? emailErrorMessage;

  final FocusNode emailFocusNode = FocusNode();

  late TextEditingController emailEditingController;
  @override
  void initState() {
    super.initState();
    emailEditingController = widget.emailEditingController;
    focusListenerFun();
    controllerListenerFun();
  }

  void focusListenerFun() {
    //to make the email field is focus when i press on it
    emailFocusNode.addListener(() {
      setState(() {});
    });
  }

  void controllerListenerFun() {
    //to listen to the action which happens in the email controller field
    emailEditingController.addListener(emailControllerFun);
  }

  @override
  void dispose() {
    focusDisposeFun();
    removeControlFun();
    super.dispose();
  }

  void focusDisposeFun() {
    //to terminate the focus of email field as soon as moving to any field
    emailFocusNode.dispose();
  }

  void removeControlFun() {
    emailEditingController.removeListener(emailControllerFun);
  }

  void emailControllerFun() {
    setState(() {
      emailErrorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      backgroundColor: kFilledTextFormFieldColor,
      hintText: 'Email',
      textEditingController: emailEditingController,
      textColor: kTextBlackPrimaryColor,
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
    );
  }
}
