import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
    required this.screenHeight,
    required GlobalKey<FormState> formKey,
    required this.emailEditingController,
  }) : _formKey = formKey;

  final double screenHeight;
  final GlobalKey<FormState> _formKey;
  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * .005),
      child: BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            customAwesomeDialog(
              context: context,
              title: 'Password Reset Email Sent',
              description:
                  'We \'ve sent a password reset link to your email. Please check your inbox and follow the instructions to reset your password.',
              isSuccess: true,
              onPressed: () {
                GoRouter.of(
                  context,
                ).push(Routes.verificationOtpViewId, extra: state.email);
              },
            );
          } else if (state is ForgetPasswordFailure) {
            customAwesomeDialog(
              context: context,
              title: state.errorMessage,
              description: 'try again later!',
              isSuccess: false,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            );
          }
        },
        builder: (context, state) {
          return CustomTextButton(
            onPressed:
                state is ForgetPasswordLoading
                    ? null
                    : () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        context.read<AuthBloc>().add(
                          ForgetPasswordEvent(
                            email: emailEditingController.text.trim(),
                          ),
                        );
                      }
                    },
            backgroundColor: kAppPrimaryBlueColor,
            child:
                state is ForgetPasswordLoading
                    ? const CustomCircleIndicator()
                    : CustomTitle(title: 'Reset Password'),
          );
        },
      ),
    );
  }
}
