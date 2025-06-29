import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../helper/const_variables.dart';
import 'custom_text_button.dart';

void customAwesomeDialog({
  required BuildContext context,
  required bool isSuccess, // Add a parameter to indicate success or failure
  final bool needCancel = false,
  final String title = 'Success process',
  final String description = 'You are in active mode',
  final String buttonText = 'ok',
  final Color dialogStateColor = kAppPrimaryBlueColor,
  final Color dialogBackgroundColor = kSecondlyLightWhiteColor,
  final Color dialogBorderColor = kSecondlyLightWhiteColor,
  final Color titleColor = kAppPrimaryBlueColor,
  final double titleSize = 24,
  final Color descriptionColor = kSecondlyDarkWhiteColor,
  final double descriptionSize = 18,
  required void Function()? onPressed,
}) {
  // Set success or failure icon and title dynamically
  final iconColor = isSuccess ? kAppPrimaryBlueColor : kAppPrimaryWrongColor;
  final dialogTitle = isSuccess ? 'Success process' : 'Failure process';
  final dialogDescription =
      isSuccess
          ? 'Process completed successfully'
          : 'Process did n\'t complete';
  final dialogButtonColor =
      isSuccess ? kAppPrimaryBlueColor : kAppPrimaryWrongColor;

  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    customHeader: Icon(Icons.check_circle, color: iconColor, size: 65),
    dialogBackgroundColor: dialogBackgroundColor,
    width: double.infinity,
    buttonsBorderRadius: BorderRadius.circular(
      MediaQuery.sizeOf(context).width * .02,
    ),
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    headerAnimationLoop: false,
    animType: AnimType.scale,
    title: title.isEmpty ? dialogTitle : title,
    desc: description.isEmpty ? dialogDescription : description,
    showCloseIcon: true,
    borderSide: BorderSide(color: dialogBorderColor, width: 2),
    btnOk: CustomTextButton(
      onPressed: () {
        if (isSuccess) {
          GoRouter.of(context).pop();
        }
        if (onPressed != null) {
          onPressed();
        }
      },
      backgroundColor: dialogButtonColor,
      shadowColor: Colors.transparent,
      child: Text(
        buttonText,
        style: AfacadTextStyles.textStyle14W500White(context),
        softWrap: true,
      ),
    ),
  ).show();
}

void warningAwesomeDialog(
  BuildContext context, {
  required String title,
  required String description,
  required String buttonAcceptText,
  required String buttonCancelText,
  required void Function()? onPressed,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    title: title,
    desc: description,
    btnCancelOnPress: () {},
    btnOkOnPress: onPressed,
    btnOkText: buttonAcceptText,
    btnCancelText: buttonCancelText,
    btnOkColor: kAppPrimaryWrongColor,
    btnCancelColor: Color(0xffFEB800).withAlpha(200),
  ).show();
}
