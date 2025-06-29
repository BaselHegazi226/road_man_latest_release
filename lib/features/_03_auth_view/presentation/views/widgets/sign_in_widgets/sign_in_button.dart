import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.buttonIsLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool buttonIsLoading;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed:
          buttonIsLoading
              ? null
              : () {
                if (formKey.currentState?.validate() ?? false) {
                  formKey.currentState?.save();
                  context.read<AuthBloc>().add(
                    SignInEvent(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    ),
                  );
                }
              },
      backgroundColor: kAppPrimaryBlueColor,
      child:
          buttonIsLoading
              ? const CustomCircleIndicator()
              : const CustomTitle(
                title: 'Sign in',
                textColor: kSecondlyLightWhiteColor,
              ),
    );
  }
}
