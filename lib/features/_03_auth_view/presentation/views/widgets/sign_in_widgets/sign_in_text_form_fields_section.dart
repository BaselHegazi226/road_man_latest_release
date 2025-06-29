import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/password_text_form_field.dart';
import 'package:road_man_project/core/utilities/routes.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignInTextFormFieldsSection extends StatefulWidget {
  const SignInTextFormFieldsSection({
    super.key,
    required this.formKey,
    required this.passwordEditingController,
    required this.emailEditingController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordEditingController;
  final TextEditingController emailEditingController;
  @override
  State<SignInTextFormFieldsSection> createState() =>
      _SignInTextFormFieldsSectionState();
}

class _SignInTextFormFieldsSectionState
    extends State<SignInTextFormFieldsSection> {
  bool obscurePassword = true;
  bool isEnableButton = true;

  String? email, password;
  String? emailErrorMessage, passwordErrorMessage;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  late TextEditingController passwordEditingController;
  late TextEditingController emailEditingController;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    emailEditingController = widget.emailEditingController;
    passwordEditingController = widget.passwordEditingController;
    focusListenerFun();
    controllerListenerFun();
  }

  void focusListenerFun() {
    //to make the email field is focus when i press on it
    emailFocusNode.addListener(() {
      setState(() {});
    });
    //to make the password field is focus when i press on it
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  void controllerListenerFun() {
    //to listen to the action which happens in the email controller field
    emailEditingController.addListener(emailControllerFun);
    //to make the password controller field listen to is the field is empty or filled or have error message
    passwordEditingController.addListener(passwordControllerFun);
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
    //to terminate the focus of password field as soon as moving to any field
    passwordFocusNode.dispose();
  }

  void removeControlFun() {
    emailEditingController.removeListener(emailControllerFun);
    passwordEditingController.removeListener(passwordControllerFun);
  }

  void emailControllerFun() {
    setState(() {
      emailErrorMessage = null;
      isEnableButton = true;
    });
  }

  void passwordControllerFun() {
    setState(() {
      passwordErrorMessage = null;
      isEnableButton = true;
    });
  }

  void successStateFun(BuildContext context) {
    // Navigate to the HomeView first
    GoRouter.of(context).push(Routes.mainViewId);
    onResetFun();
  }

  void loadedStateFun() {
    setState(() {
      //to make the isEnableButton is false when the event is in the load state
      isEnableButton = false;
    });
  }

  void onResetFun() {
    setState(() {
      //reActive the sign in button
      isEnableButton = true;
      //make the sate of the form is disable to enable me to sign in Later
      autoValidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: widget.formKey,
      child: Column(
        spacing: screenHeight * 0.02,
        children: [
          CustomTextFormField(
            backgroundColor: kFilledTextFormFieldColor,
            hintText: 'Email',
            textEditingController: emailEditingController,
            keyboardType: TextInputType.text,
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
          ),
          PasswordTextFormField(
            backgroundColor: kFilledTextFormFieldColor,
            obscureText: obscurePassword,
            hintText: 'Password',
            textEditingController: passwordEditingController,
            keyboardType: TextInputType.text,
            textColor: kTextBlackPrimaryColor,
            prefixIcon: Icons.lock_outline,
            suffixIcon:
                obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            suffixIconOnPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            validator: (password) {
              if (password!.isEmpty) {
                return 'Please enter an password';
              } else if (passwordErrorMessage != null) {
                return passwordErrorMessage;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
