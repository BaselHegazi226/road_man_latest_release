import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/social_auth_card_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_text_form_field_section.dart';

import '../sign_in_widgets/other_register_section.dart';
import 'sign_up_bloc_consumer.dart'; // تم إضافة هذا

class SignUpInputDataSection extends StatefulWidget {
  const SignUpInputDataSection({super.key});

  @override
  State<SignUpInputDataSection> createState() => _SignUpInputDataSectionState();
}

class _SignUpInputDataSectionState extends State<SignUpInputDataSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool socialButtonIsLoading = false;

  bool get anyButtonIsLoading => socialButtonIsLoading;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      spacing: screenHeight * .025,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight * .005),
          child: SignUpTextFormFieldSection(
            formKey: _formKey,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
          ),
        ),
        // BlocConsumer منفصل
        SignUpBlocConsumer(
          formKey: _formKey,
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
        ),

        SocialAuthCardSection(
          title: 'Sign up With google',
          authButtonIsLoading: anyButtonIsLoading,
          onSocialAuthLoadingChanged: (isLoading) {
            setState(() {
              socialButtonIsLoading = isLoading;
            });
          },
        ),

        OtherRegisterSection(
          onTap:
              anyButtonIsLoading
                  ? null
                  : () {
                    GoRouter.of(context).pop();
                  },
          blackText: 'Already have an account? ',
          blueText: 'Sign In',
        ),
      ],
    );
  }
}
