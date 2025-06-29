import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.buttonIsLoading,
    required this.anyButtonIsLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool buttonIsLoading;
  final bool anyButtonIsLoading;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed:
          anyButtonIsLoading
              ? null
              : () {
                if (formKey.currentState?.validate() ?? false) {
                  formKey.currentState?.save();
                  context.read<AuthBloc>().add(
                    SignUpEvent(
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    ),
                  );
                  print('name : ${nameController.text}');
                  print('password : ${passwordController.text}');
                  print('email : ${emailController.text}');
                }
              },
      backgroundColor: kAppPrimaryBlueColor,
      child:
          buttonIsLoading
              ? const CustomCircleIndicator()
              : const CustomTitle(
                title: 'Sign up',
                textColor: kSecondlyLightWhiteColor,
              ),
    );
  }
}
