import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/class_const_functions.dart';
import '../../../../../../core/helper/const_variables.dart';

class CustomSettingFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final FocusNode? focusNode; // Added FocusNode
  final String? errorMess;
  final Color textColor;
  final Color backgroundColor;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  const CustomSettingFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.textColor = kSettingsTextFormFieldColor,
    this.backgroundColor = kSettingsBackgroundFormFieldColor,
    this.onChanged,
    this.focusNode,
    this.validator,
    this.errorMess,
    this.onFieldSubmitted,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: screenWidth,
      height: screenHeight * .05,
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
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: ConstFunctions.settingsTextTextFormFieldStyle(context),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(
            left: screenWidth * .04,
            top: screenHeight * .02,
            bottom: screenHeight * .02,
          ),
          hintStyle: ConstFunctions.hintSettingsTextFormFieldStyle(context),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: ConstFunctions.outlineInputBorder(),
          enabledBorder: ConstFunctions.outlineInputBorder(
            color: kSettingsBorderFormFieldColor,
          ),
          focusedBorder: ConstFunctions.outlineInputBorder(
            color: kSettingsBorderFormFieldColor, // Focus color applied here
          ),
          disabledBorder: ConstFunctions.outlineInputBorder(),
          errorBorder: ConstFunctions.outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? kSettingsBorderFormFieldColor // Change to focus color on error
                    : kErrorColor,
          ),
          focusedErrorBorder: ConstFunctions.outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? kSettingsBorderFormFieldColor // Change to focus color on error
                    : kErrorColor,
          ),
          errorStyle: AfacadTextStyles.textStyle12W400Black(
            context,
          ).copyWith(color: Colors.red),
          errorText: errorMess,
          fillColor: backgroundColor,
          filled: true,
        ),
      ),
    );
  }
}
