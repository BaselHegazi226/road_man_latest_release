import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../helper/class_const_functions.dart';
import '../helper/const_variables.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final FocusNode? focusNode; // Added FocusNode
  final String? errorMess;
  final Color textColor;
  final Color backgroundColor;
  final double prefixIconSize;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.textColor = kTextBlackPrimaryColor,
    this.backgroundColor = kFilledTextFormFieldColor,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.focusNode,
    this.validator,
    this.errorMess,
    this.prefixIconSize = 24,
    this.onFieldSubmitted,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: TextFormField(
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        controller: textEditingController,
        obscureText: obscureText,
        focusNode: focusNode,
        cursorColor: kCursorFieldColor,
        // Assigned FocusNode
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: ConstFunctions.textTextFormFieldStyle(context),
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            size: prefixIconSize,
            color: kIconTextFormFieldColor,
          ),
          hintText: hintText,
          hintStyle: ConstFunctions.hintTextFormFieldStyle(context),
          labelStyle: ConstFunctions.hintTextFormFieldStyle(context),
          border: ConstFunctions.outlineInputBorder(),
          enabledBorder: ConstFunctions.outlineInputBorder(),
          focusedBorder: ConstFunctions.outlineInputBorder(
            color: kBorderTextFormFieldColor, // Focus color applied here
          ),
          disabledBorder: ConstFunctions.outlineInputBorder(),
          errorBorder: ConstFunctions.outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? kBorderTextFormFieldColor // Change to focus color on error
                    : kErrorColor,
          ),
          focusedErrorBorder: ConstFunctions.outlineInputBorder(
            color:
                focusNode != null && focusNode!.hasFocus
                    ? kBorderTextFormFieldColor // Change to focus color on error
                    : kErrorColor,
          ),
          errorStyle: AfacadTextStyles.textStyle12W400Black(
            context,
          ).copyWith(color: kAppPrimaryWrongColor),
          errorText: errorMess,
          fillColor: backgroundColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenSize.height * .015,
            horizontal: screenSize.width * .02,
          ), // Adjusted padding
          errorMaxLines:
              1, // Ensures error text doesn't affect the height of the TextField
        ),
        minLines: 1, // Ensures a fixed height for the TextField
        maxLines: 1, // Keep the height consistent
      ),
    );
  }
}
