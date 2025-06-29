import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

import 'sign_in_button.dart';

class SignInBlocConsumer extends StatefulWidget {
  const SignInBlocConsumer({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignInBlocConsumer> createState() => _SignInBlocConsumerState();
}

class _SignInBlocConsumerState extends State<SignInBlocConsumer> {
  bool buttonIsLoading = false;

  void _handleSignInSuccess(BuildContext context) {
    customAwesomeDialog(
      context: context,
      isSuccess: true,
      title: 'Sign in Success',
      description: 'You have successfully signed into Road Man.',
      onPressed: () {
        GoRouter.of(context).push(Routes.mainViewId);
      },
    );
  }

  void _handleSignInFailure(BuildContext context, SignInFailure state) {
    customAwesomeDialog(
      context: context,
      isSuccess: false,
      title: 'Sign In Failure',
      description: state.errorMessage,
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          _handleSignInSuccess(context);
        } else if (state is SignInFailure) {
          _handleSignInFailure(context, state);
        }

        setState(() {
          buttonIsLoading = state is SignInLoading;
        });
      },
      builder: (context, state) {
        return SignInButton(
          formKey: widget.formKey,
          emailController: widget.emailController,
          passwordController: widget.passwordController,
          buttonIsLoading: buttonIsLoading,
        );
      },
    );
  }
}
