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

class VerifyOtpButton extends StatelessWidget {
  const VerifyOtpButton({
    super.key,
    required this.email,
    required this.otpControllers,
    required this.formKey,
    required this.autoValidateMode,
    required this.setAutoValidateMode,
    required this.isLoading,
    required this.isOtherButtonLoading,
    required this.setLoading,
  });

  final String email;
  final List<TextEditingController> otpControllers;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  final void Function(AutovalidateMode) setAutoValidateMode;
  final bool isLoading;
  final bool isOtherButtonLoading;
  final void Function(bool) setLoading;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is VerificationOtpLoading) {
          setLoading(true);
        } else if (state is VerificationOtpSuccess ||
            state is VerificationOtpFailure) {
          setLoading(false);

          if (state is VerificationOtpSuccess) {
            customAwesomeDialog(
              context: context,
              isSuccess: true,
              title: 'Verification Successful',
              description: 'Your OTP has been verified successfully.',
              buttonText: 'Continue to Reset Password',
              onPressed: () {
                GoRouter.of(context).push(
                  Routes.resetPasswordViewId,
                  extra: {
                    'email': email,
                    'otp': otpControllers.map((e) => e.text).join(),
                  },
                );
              },
            );
          } else if (state is VerificationOtpFailure) {
            customAwesomeDialog(
              context: context,
              title: 'Verification Failed',
              description: state.errorMessage,
              buttonText: 'Try Again!',
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
              isLoading || isOtherButtonLoading
                  ? null
                  : () {
                    if (formKey.currentState!.validate()) {
                      final otp = otpControllers.map((e) => e.text).join();
                      context.read<AuthBloc>().add(
                        VerifyOtpEvent(email: email, otp: otp),
                      );
                    } else {
                      setAutoValidateMode(AutovalidateMode.always);
                    }
                  },
          backgroundColor: kAppPrimaryBlueColor,
          child:
              isLoading
                  ? const CustomCircleIndicator()
                  : const CustomTitle(title: 'Verify Otp'),
        );
      },
    );
  }
}
