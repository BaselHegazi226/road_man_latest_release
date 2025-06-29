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
    Color borderColor = Colors.black,
    double borderRadius = 8,
  }) {
    return PinTheme(
      height: HeightWidthPinPutOtp.backSizeFun(context).value1,
      width: HeightWidthPinPutOtp.backSizeFun(context).value2,
      textStyle: TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        color: kAppPrimaryWhiteColor,
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
