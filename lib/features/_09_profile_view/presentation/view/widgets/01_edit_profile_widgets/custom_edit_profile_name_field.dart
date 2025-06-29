import 'package:flutter/material.dart';

import '../../../../../../core/helper/class_const_functions.dart';
import '../../../../../../core/helper/const_variables.dart';

class CustomEditProfileNameField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? errorMess, labelText;
  final double textLetterSpacing;
  final Color underlineColor, fullColor, shadowColor;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  const CustomEditProfileNameField({
    super.key,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.prefixIcon = Icons.key_outlined,
    this.underlineColor = kEditProfileFieldBorderColor,
    this.fullColor = kEditProfileContainer3Color,
    this.shadowColor = Colors.transparent,
    this.textLetterSpacing = 1,
    this.focusNode,
    this.validator,
    this.errorMess,
    this.onFieldSubmitted,
    this.onSaved,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(
        top: screenHeight * .015,
        bottom: screenHeight * .02,
        left: screenWidth * .04,
        right: screenWidth * .01,
      ),
      height: screenHeight * .08,
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
        style: ConstFunctions.editProfileTextStyle(
          context,
          letterSpacing: textLetterSpacing,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(bottom: screenHeight * .01),
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
            spacing: screenWidth * .03,
            children: [
              Icon(
                prefixIcon,
                size: screenWidth * .06,
                color: kEditProfileIconColor,
              ),
              Container(
                width: screenWidth * .005,
                color: kEditProfileDividerColor,
              ),
            ],
          ),
          suffixIcon: Icon(
            Icons.edit_outlined,
            color: kEditProfileTitleColor,
            size: screenWidth * .06,
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
