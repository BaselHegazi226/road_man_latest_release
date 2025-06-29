import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/core/utilities/text_under_line.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_password_fields_section.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_event.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';

import '../../../../../../core/utilities/routes.dart';

class ChangePasswordViewInputDataSection extends StatefulWidget {
  const ChangePasswordViewInputDataSection({super.key});

  @override
  State<ChangePasswordViewInputDataSection> createState() =>
      _ChangePasswordViewInputDataSectionState();
}

class _ChangePasswordViewInputDataSectionState
    extends State<ChangePasswordViewInputDataSection> {
  TextEditingController currentPasswordEditingController =
      TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonIsLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditProfilePasswordFieldsSection(
          formKey: _formKey,
          currentPasswordEditingController: currentPasswordEditingController,
          newPasswordEditingController: newPasswordEditingController,
          confirmPasswordEditingController: confirmPasswordEditingController,
        ),
        SizedBox(height: screenSize.height * .03),
        BlocConsumer<ProfileBloc, ProfileStates>(
          listener: (context, state) {
            if (state is ChangePasswordSuccessState) {
              showSafeSnackBar(
                context,
                'Password Successfully Updated',
                kAppPrimaryBlueColor,
              );
              clearFun();
            } else if (state is ChangePasswordFailureState) {
              showSafeSnackBar(
                context,
                state.errorMessage,
                kAppPrimaryBlueColor,
              );
            }
            setState(() {
              buttonIsLoading = state is ChangePasswordLoadingState;
            });
          },
          builder: (context, state) {
            return CustomTextButton(
              onPressed:
                  buttonIsLoading
                      ? null
                      : () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context.read<ProfileBloc>().add(
                            ChangePasswordEvent(
                              oldPassword:
                                  currentPasswordEditingController.text.trim(),
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
                  buttonIsLoading
                      ? const CustomCircleIndicator()
                      : CustomTitle(title: 'Update Password'),
            );
          },
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(Routes.profileForgetPasswordViewId);
          },
          child: TextUnderLine(
            text: 'Forget password?',
            textColor: kAppPrimaryWrongColor,
          ),
        ),
      ],
    );
  }

  void clearFun() {
    currentPasswordEditingController.clear();
    newPasswordEditingController.clear();
    confirmPasswordEditingController.clear();
  }
}
