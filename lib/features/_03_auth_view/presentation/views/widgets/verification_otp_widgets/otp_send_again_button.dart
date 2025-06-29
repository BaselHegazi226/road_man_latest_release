import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

import '../../../../../../core/helper/const_variables.dart';

class OtpSendAgainButton extends StatelessWidget {
  const OtpSendAgainButton({
    super.key,
    required this.email,
    required this.isLoading,
    required this.isOtherButtonLoading,
    required this.setLoading,
  });

  final String email;
  final bool isLoading;
  final bool isOtherButtonLoading;
  final void Function(bool) setLoading;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          setLoading(true);
        } else if (state is ForgetPasswordSuccess ||
            state is ForgetPasswordFailure) {
          setLoading(false);

          if (state is ForgetPasswordSuccess) {
            showSafeSnackBar(
              context,
              'Please check your inbox',
              kAppPrimaryBlueColor.withAlpha(126),
            );
          } else if (state is ForgetPasswordFailure) {
            showSafeSnackBar(
              context,
              'Send again error: ${state.errorMessage}',
              kAppPrimaryWrongColor.withAlpha(126),
            );
          }
        }
      },
      builder: (context, state) {
        return TextButton(
          onPressed:
              isLoading || isOtherButtonLoading
                  ? null
                  : () {
                    context.read<AuthBloc>().add(
                      ForgetPasswordEvent(email: email),
                    );
                  },
          child:
              isLoading
                  ? const CustomCircleIndicator()
                  : Text(
                    'Send again ?',
                    style: AfacadTextStyles.textStyle20W700Blue(context),
                  ),
        );
      },
    );
  }
}
