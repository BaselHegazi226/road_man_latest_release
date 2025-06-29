import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

import '../../../../../../core/helper/const_variables.dart';

class VerifyEmailButton extends StatelessWidget {
  const VerifyEmailButton({
    super.key,
    required this.formKey,
    required this.otpControllers,
    required this.email,
    required this.autoValidateMode,
    required this.setAutoValidateMode,
    required this.isLoading,
    required this.sendAgainIsLoading,
    required this.setLoading,
  });

  final GlobalKey<FormState> formKey;
  final List<TextEditingController> otpControllers;
  final String email;
  final AutovalidateMode autoValidateMode;
  final void Function(AutovalidateMode) setAutoValidateMode;
  final bool isLoading;
  final bool sendAgainIsLoading;
  final void Function(bool) setLoading;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is VerificationEmailLoading) {
          setLoading(true);
        } else if (state is VerificationEmailSuccess ||
            state is VerificationEmailFailure) {
          setLoading(false);

          if (state is VerificationEmailSuccess) {
            customAwesomeDialog(
              context: context,
              title: 'Verify Email Success',
              description: 'Go To Your Questionnaire!',
              isSuccess: true,
              onPressed: () {
                GoRouter.of(context).go(Routes.questionnaireViewId);
              },
            );
          } else if (state is VerificationEmailFailure) {
            customAwesomeDialog(
              context: context,
              title: 'Verify Email Failed',
              description: 'Try to send verify email again!',
              isSuccess: false,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            );
          }
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          onPressed:
              isLoading || sendAgainIsLoading
                  ? null
                  : () {
                    if (formKey.currentState!.validate()) {
                      final otp = otpControllers.map((e) => e.text).join();
                      context.read<AuthBloc>().add(
                        VerifyEmailEvent(email: email, otp: otp),
                      );
                    } else {
                      setAutoValidateMode(AutovalidateMode.always);
                    }
                  },
          backgroundColor: kAppPrimaryBlueColor,
          child:
              isLoading
                  ? const CustomCircleIndicator()
                  : const CustomTitle(title: 'Verify Email'),
        );
      },
    );
  }
}
