import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class CustomTextFormFieldOtp extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Color generalColor;
  final Color backgroundColor;

  const CustomTextFormFieldOtp({
    super.key,
    this.hintText = '',
    required this.textEditingController,
    this.keyboardType = TextInputType.number,
    this.generalColor = kBorderOtpFieldColor,
    this.backgroundColor = kSecondlyDarkWhiteColor,
    this.obscureText = false,
    this.onChanged,
    this.focusNode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 55,
      child: TextFormField(
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.singleLineFormatter,
        ],
        keyboardType: keyboardType,
        controller: textEditingController,
        obscureText: obscureText,
        onChanged: onChanged,
        focusNode: focusNode,
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
        textInputAction: TextInputAction.next,
        cursorColor: kCursorFieldColor,
        textAlign: TextAlign.center,
        cursorHeight: 28,
        cursorOpacityAnimates: true,
        style: TextStyle(
          color: generalColor,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 24,
            color: kTextOtpFieldColor,
            fontWeight: FontWeight.w400,
          ),
          border: outlineInputBorder(color: generalColor),
          enabledBorder: outlineInputBorder(color: generalColor),
          focusedBorder: outlineInputBorder(color: generalColor),
          disabledBorder: outlineInputBorder(color: generalColor),
          errorBorder: outlineInputBorder(color: kErrorColor),
          focusedErrorBorder: outlineInputBorder(color: kErrorColor),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: .3,
          ),
          fillColor: backgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({
    double borderRadius = 8,
    required Color color,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
