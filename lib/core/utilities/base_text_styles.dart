import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/helper/responsive_font_size.dart';

class BaseTextStyles {
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final double height;

  const BaseTextStyles({
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.fontFamily,
    this.height = 1.0,
  });

  TextStyle getTextStyle(BuildContext context) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      height: height,
    );
  }
}

//Afacad TextStyle Class

class AfacadTextStyles extends BaseTextStyles {
  const AfacadTextStyles({
    required super.color,
    required super.fontSize,
    required super.fontWeight,
    super.height,
  }) : super(fontFamily: 'afacad');

  //font size 12
  static TextStyle textStyle12W400Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle16W400Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle18W600Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle12W400Grey(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextGreyPrimaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle12W500Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ).getTextStyle(context);

  static TextStyle textStyle12W700Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ).getTextStyle(context);

  static TextStyle textStyle12W700Color8A8C90(BuildContext context) =>
      const AfacadTextStyles(
        color: Color(0xff8A8C90),
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ).getTextStyle(context);

  //font size 13
  static TextStyle textStyle13W400H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ).getTextStyle(context);

  //font size 14
  static TextStyle textStyle14W400Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle14W400Grey(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextGreyPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle14W400Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle14W400H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle14W500Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ).getTextStyle(context);

  static TextStyle textStyle14W500White(BuildContext context) =>
      const AfacadTextStyles(
        color: kSecondlyLightWhiteColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle14W600Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle14W600DeepGrey(BuildContext context) =>
      const AfacadTextStyles(
        color: kQuizViewSecondlyColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle14W600H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle14W600Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle14W700H150Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle14W700H150White(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryWhiteColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.5,
      ).getTextStyle(context);

  //font size 15
  static TextStyle textStyle15W500Grey(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextGreyPrimaryColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ).getTextStyle(context);

  //font size 16
  static TextStyle textStyle16W400H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle16W400Grey(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextGreyPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle16W500Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ).getTextStyle(context);

  static TextStyle textStyle16W500H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle16W500LightWhite(BuildContext context) =>
      const AfacadTextStyles(
        color: kSecondlyLightWhiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ).getTextStyle(context);

  static TextStyle textStyle16W500H150Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle16W600H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle16W600Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle16W600HBlue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle16W600Grey(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextGreyHalfOpacityPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle16W700H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle16W700Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ).getTextStyle(context);

  static TextStyle textStyle16W700Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ).getTextStyle(context);

  //font size 18
  static TextStyle textStyle18W400Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle18W600H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlackColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ).getTextStyle(context);

  //font size 20
  static TextStyle textStyle20W400Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlackColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  static TextStyle textStyle20W500Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ).getTextStyle(context);

  static TextStyle textStyle20W600Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle20W600Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);

  static TextStyle textStyle20W700Blue(BuildContext context) =>
      const AfacadTextStyles(
        color: kAppPrimaryBlueColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ).getTextStyle(context);

  //font size 24
  static TextStyle textStyle24W600H150Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ).getTextStyle(context);

  static TextStyle textStyle24W700Black(BuildContext context) =>
      const AfacadTextStyles(
        color: kTextBlackPrimaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ).getTextStyle(context);
}

// Inter TextStyle Class

class InterTextStyles extends BaseTextStyles {
  const InterTextStyles({
    required super.color,
    required super.fontSize,
    required super.fontWeight,
    super.height,
  }) : super(fontFamily: 'inter');

  // font Size 12

  static TextStyle textStyle12W500Black(BuildContext context) =>
      InterTextStyles(
        color: kAppPrimaryBlackColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ).getTextStyle(context);

  static TextStyle textStyle12W500Blue(BuildContext context) => InterTextStyles(
    color: kAppPrimaryBlueColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ).getTextStyle(context);

  static TextStyle textStyle12W400GreyHalfOpacity({
    required BuildContext context,
  }) => InterTextStyles(
    color: kTextGreyHalfOpacityPrimaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ).getTextStyle(context);
  static TextStyle textStyle12W500GreyHalfOpacity({
    required BuildContext context,
  }) => InterTextStyles(
    color: kTextGreyHalfOpacityPrimaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ).getTextStyle(context);

  // Text Styles with Font Size 13

  static TextStyle textStyle13W400Black(BuildContext context) =>
      InterTextStyles(
        color: kTextGreyPrimaryColor,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ).getTextStyle(context);

  // Jost TextStyle Class
}

class JostTextStyles extends BaseTextStyles {
  const JostTextStyles({
    required super.color,
    required super.fontSize,
    required super.fontWeight,
    super.height,
  }) : super(fontFamily: 'jost');
  // font Size 15
  static TextStyle textStyle15W600Black(BuildContext context) => JostTextStyles(
    color: kTextBlackPrimaryColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  ).getTextStyle(context);
  static TextStyle textStyle15W600Blue(BuildContext context) => JostTextStyles(
    color: kAppPrimaryBlueColor,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  ).getTextStyle(context);
}

// Montserrat TextStyle Class

class MontserratTextStyles extends BaseTextStyles {
  const MontserratTextStyles({
    required super.color,
    required super.fontSize,
    required super.fontWeight,
    super.height,
  }) : super(fontFamily: 'montserrat');

  // font Size 15
  static TextStyle textStyle16W600DeepGrey(BuildContext context) {
    return const MontserratTextStyles(
      color: kQuizViewSecondlyColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ).getTextStyle(context);
  }

  // font Size 16
  static TextStyle textStyle16W600Black(BuildContext context) =>
      const MontserratTextStyles(
        color: kAppPrimaryBlackColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ).getTextStyle(context);
}
