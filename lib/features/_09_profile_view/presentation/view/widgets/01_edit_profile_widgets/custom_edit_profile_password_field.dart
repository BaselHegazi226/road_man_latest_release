import 'package:flutter/material.dart';

import '../../../../../../core/helper/class_const_functions.dart';
import '../../../../../../core/helper/const_variables.dart';

class CustomEditProfilePasswordField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? errorMess, labelText;
  final double suffixIconSize;
  final double textLetterSpacing;
  final Color underlineColor, fullColor, shadowColor;
  final void Function()? suffixIconOnPressed;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  const CustomEditProfilePasswordField({
    super.key,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.obscureText = true,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon = Icons.key_outlined,
    this.underlineColor = kEditProfileFieldBorderColor,
    this.fullColor = kEditProfileContainer3Color,
    this.shadowColor = Colors.transparent,
    this.textLetterSpacing = 1,
    this.focusNode,
    this.validator,
    this.errorMess,
    this.suffixIconSize = 20,
    this.onFieldSubmitted,
    this.onSaved,
    this.suffixIconOnPressed,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.only(top: 12, bottom: 16, left: 16, right: 16),
      height: 72,
      decoration: BoxDecoration(
        color: fullColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        controller: textEditingController,
        focusNode: focusNode,
        cursorColor: kCursorFieldColor,
        cursorHeight: 14,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.start,
        obscuringCharacter: '●',
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        style: ConstFunctions.editProfileTextStyle(
          context,
          letterSpacing: textLetterSpacing,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(bottom: 8),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kEditProfileFieldBorderColor,
              width: 1.5,
            ),
          ),
          enabledBorder: ConstFunctions.underLineInputBorder(
            underlineColor: underlineColor,
          ),
          focusedBorder: ConstFunctions.underLineInputBorder(
            underlineColor: underlineColor,
          ),
          disabledBorder: ConstFunctions.underLineInputBorder(
            underlineColor: underlineColor,
          ),
          errorBorder: ConstFunctions.underLineInputBorder(
            underlineColor:
                focusNode != null && focusNode!.hasFocus
                    ? kBorderTextFormFieldColor // Change to focus color on error
                    : kErrorColor,
          ),
          focusedErrorBorder: ConstFunctions.underLineInputBorder(
            underlineColor:
                focusNode != null && focusNode!.hasFocus
                    ? kBorderTextFormFieldColor // Change to focus color on error
                    : kErrorColor,
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Icon(prefixIcon, size: 24, color: kEditProfileIconColor),
              Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: VerticalDivider(
                  thickness: 1,
                  color: kEditProfileDividerColor,
                ),
              ),
            ],
          ),
          suffixIcon: IconButton(
            padding: EdgeInsets.only(top: 8),
            icon: Icon(
              suffixIcon,
              size: suffixIconSize,
              color: kEditProfileIconColor,
            ),
            onPressed: suffixIconOnPressed ?? () {},
          ),
          labelText: labelText,
          labelStyle: ConstFunctions.editProfilePasswordFieldStyleLabelStyle(
            context,
          ),
        ),
      ),
    );
  }
}
