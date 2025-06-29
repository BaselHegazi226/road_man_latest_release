import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

import '../../../../../../core/helper/const_variables.dart';

class VerifyEmailSendAgainButton extends StatelessWidget {
  const VerifyEmailSendAgainButton({
    super.key,
    required this.isLoading,
    required this.sendAgainIsLoading,
    required this.otpControllers,
    required this.email,
  });

  final bool isLoading;
  final bool sendAgainIsLoading;
  final List<TextEditingController> otpControllers;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is SendAgainVerificationSuccess) {
          showSafeSnackBar(
            context,
            'Check your inbox!',
            kAppPrimaryBlueColor.withAlpha(125),
          );
        }
        if (state is SendAgainVerificationFailure) {
          showSafeSnackBar(
            context,
            state.errorMessage,
            kAppPrimaryWrongColor.withAlpha(125),
          );
        }
      },
      builder: (context, state) {
        return TextButton(
          onPressed:
              sendAgainIsLoading || isLoading
                  ? null
                  : () {
                    final otp = otpControllers.map((e) => e.text).join();
                    context.read<AuthBloc>().add(
                      SendAgainVerifyEmailEvent(email: email, otp: otp),
                    );
                  },
          child:
              sendAgainIsLoading
                  ? CustomCircleIndicator(color: kAppPrimaryBlueColor)
                  : Text(
                    'Send again ?',
                    style: AfacadTextStyles.textStyle20W700Blue(context),
                  ),
        );
      },
    );
  }
}
