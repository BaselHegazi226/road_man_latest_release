import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

import 'sign_up_button.dart';

class SignUpBlocConsumer extends StatefulWidget {
  const SignUpBlocConsumer({
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
  State<SignUpBlocConsumer> createState() => _SignUpBlocConsumerState();
}

class _SignUpBlocConsumerState extends State<SignUpBlocConsumer> {
  bool buttonIsLoading = false;

  void _handleSignUpSuccess(BuildContext context) {
    customAwesomeDialog(
      context: context,
      isSuccess: true,
      title: 'Sign Up Success',
      description: 'Check inbox and verify code please!',
      buttonText: 'Continue to Verify code',
      onPressed: () {
        GoRouter.of(context).push(
          Routes.verificationEmailViewId,
          extra: widget.emailController.text.trim(),
        );
      },
    );
  }

  void _handleSignUpFailure(BuildContext context, String errorMessage) {
    customAwesomeDialog(
      context: context,
      isSuccess: false,
      title: 'Sign Up Failure',
      description: errorMessage,
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
    print('error message :$errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          _handleSignUpSuccess(context);
        } else if (state is SignUpFailure) {
          _handleSignUpFailure(context, state.errorMessage);
        }

        setState(() {
          buttonIsLoading = state is SignUpLoading;
        });
      },
      builder: (context, state) {
        return SignUpButton(
          formKey: widget.formKey,
          nameController: widget.nameController,
          emailController: widget.emailController,
          passwordController: widget.passwordController,
          buttonIsLoading: buttonIsLoading,
          anyButtonIsLoading: buttonIsLoading,
        );
      },
    );
  }
}
