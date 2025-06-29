import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class HeightWidthPinPutOtp {
  static Tuple2<double, double> backSizeFun(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height * .06;
    final double width = MediaQuery.sizeOf(context).width * .13;
    return Tuple2(height, width);
  }
}

class PinThemesPinPutOtpClass {
  static PinTheme customPinThemeFunc(
    BuildContext context, {
    Color textColor = kAppPrimaryBlueColor,
    Color borderColor = kOtpPinThemeBorderColor,
    double borderRadius = 8,
  }) {
    return PinTheme(
      height: HeightWidthPinPutOtp.backSizeFun(context).value1,
      width: HeightWidthPinPutOtp.backSizeFun(context).value2,
      textStyle: TextStyle(
        fontSize: 24,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'ubuntuCondensed',
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(40),
        border: Border.all(width: 2, color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
