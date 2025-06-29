import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/social_auth_card_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/other_register_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_bloc_consumer.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_password_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_text_form_fields_section.dart';

class SignInInputDataSection extends StatefulWidget {
  const SignInInputDataSection({super.key});

  @override
  State<SignInInputDataSection> createState() => _SignInInputDataSectionState();
}

class _SignInInputDataSectionState extends State<SignInInputDataSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool socialButtonIsLoading = false;

  bool get anyButtonIsLoading => socialButtonIsLoading;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      spacing: screenHeight * 0.025,
      children: [
        SignInTextFormFieldsSection(
          formKey: _formKey,
          emailEditingController: emailController,
          passwordEditingController: passwordController,
        ),

        RememberMeForgetPasswordSection(
          forgetPasswordPressed: () {
            GoRouter.of(context).push(Routes.forgetPasswordViewId);
          },
        ),

        SignInBlocConsumer(
          formKey: _formKey,
          emailController: emailController,
          passwordController: passwordController,
        ),

        SocialAuthCardSection(
          title: 'Sign in With google',
          authButtonIsLoading: anyButtonIsLoading,
          onSocialAuthLoadingChanged: (isLoading) {
            setState(() {
              socialButtonIsLoading = isLoading;
            });
          },
        ),

        OtherRegisterSection(
          blackText: 'Don’t have an account? ',
          blueText: 'Sign up',
          onTap:
              anyButtonIsLoading
                  ? null
                  : () {
                    GoRouter.of(context).push(Routes.signUpViewId);
                  },
        ),
      ],
    );
  }
}
