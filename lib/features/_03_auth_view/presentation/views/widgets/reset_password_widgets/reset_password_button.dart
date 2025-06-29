import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/reset_password_widgets/reset_password_input_data_section.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
    required this.screenHeight,
    required GlobalKey<FormState> formKey,
    required this.resetPasswordInputDataSectionWidget,
    required this.newPasswordEditingController,
    required this.confirmPasswordEditingController,
  }) : _formKey = formKey;

  final double screenHeight;
  final GlobalKey<FormState> _formKey;
  final ResetPasswordInputDataSection resetPasswordInputDataSectionWidget;
  final TextEditingController newPasswordEditingController;
  final TextEditingController confirmPasswordEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * .02),
      child: BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            customAwesomeDialog(
              context: context,
              isSuccess: true,
              title: 'Password Updated Successfully',
              description:
                  'Your password has been changed. Please log in with your new password',
              buttonText: 'Continue to Sign in',
              onPressed: () {
                GoRouter.of(context).push(Routes.signInViewId);
              },
            );
          } else if (state is ResetPasswordFailure) {
            customAwesomeDialog(
              context: context,
              isSuccess: false,
              title: 'Password Update Failed',
              description: state.errorMessage,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            );
          }
        },
        builder: (context, state) {
          return CustomTextButton(
            onPressed:
                state is ResetPasswordLoading
                    ? null
                    : () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthBloc>().add(
                          ResetPasswordEvent(
                            email:
                                resetPasswordInputDataSectionWidget
                                    .emailAndOtp['email'],
                            otp:
                                resetPasswordInputDataSectionWidget
                                    .emailAndOtp['otp'],
                            newPassword:
                                newPasswordEditingController.text.trim(),
                            confirmPassword:
                                confirmPasswordEditingController.text.trim(),
                          ),
                        );
                      }
                    },
            backgroundColor: kAppPrimaryBlueColor,
            child:
                state is ResetPasswordLoading
                    ? const CustomCircleIndicator()
                    : const CustomTitle(title: 'Update Password'),
          );
        },
      ),
    );
  }
}
