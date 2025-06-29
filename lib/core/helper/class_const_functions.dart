import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../utilities/base_text_styles.dart';
import 'const_variables.dart';

class ConstFunctions {
  static Tuple2<IconData, Color> iconDataAndColorFun({
    required bool condition,
  }) {
    IconData iconData;
    Color color;
    if (condition) {
      iconData = kEnableIconData;
      color = kAppPrimaryBlueColor;
    } else {
      iconData = kDisableIconData;
      color = kCheckPasswordItemColor;
    }
    return Tuple2(iconData, color);
  }

  static DialogType dialogType({required final String type}) {
    switch (type) {
      case 'success':
        return DialogType.success;
      case 'error':
        return DialogType.error;
      case 'info':
        return DialogType.info;
      case 'infoReverse':
        return DialogType.infoReverse;
      case 'noHeader':
        return DialogType.noHeader;
      case 'question':
        return DialogType.question;
      case 'warning':
        return DialogType.warning;
      default:
        return DialogType.success;
    }
  }

  static TextStyle textTextFormFieldStyle(BuildContext context) {
    return AfacadTextStyles.textStyle14W400H150Black(
      context,
    ).copyWith(color: kTextTextFormFieldColor, letterSpacing: .266);
  }

  static TextStyle editProfileTextFormFieldStyle(BuildContext context) {
    return AfacadTextStyles.textStyle18W600H150Black(context);
  }

  static TextStyle settingsTextTextFormFieldStyle(BuildContext context) {
    return AfacadTextStyles.textStyle16W600H150Black(
      context,
    ).copyWith(color: kSettingsTextFormFieldColor);
  }

  static TextStyle editProfilePasswordFieldStyleLabelStyle(
    BuildContext context,
  ) {
    return AfacadTextStyles.textStyle20W600Black(
      context,
    ).copyWith(color: kEditProfileTitleColor);
  }

  static TextStyle editProfileTextStyle(
    BuildContext context, {
    double letterSpacing = 1,
  }) {
    return AfacadTextStyles.textStyle16W600H150Black(
      context,
    ).copyWith(height: 1, letterSpacing: letterSpacing);
  }

  static TextStyle hintTextFormFieldStyle(BuildContext context) {
    return AfacadTextStyles.textStyle14W400H150Black(
      context,
    ).copyWith(color: kTextTextFormFieldColor, letterSpacing: -.266);
  }

  static TextStyle hintEditProfilePasswordFieldStyle(BuildContext context) {
    return AfacadTextStyles.textStyle14W400Black(
      context,
    ).copyWith(color: kEditProfileHintTextColor);
  }

  static TextStyle hintSettingsTextFormFieldStyle(BuildContext context) {
    return AfacadTextStyles.textStyle16W600H150Black(
      context,
    ).copyWith(color: kSettingsHintTextFormFieldColor, height: 1);
  }

  static OutlineInputBorder outlineInputBorder({
    Color color = Colors.transparent,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  static UnderlineInputBorder underLineInputBorder({
    Color underlineColor = Colors.transparent,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: underlineColor, width: 1.5),
    );
  }
}
