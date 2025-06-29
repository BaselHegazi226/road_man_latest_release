import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    this.shadowColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.buttonWidth = double.infinity,
    this.buttonHeight = 0,
    required this.child,
  });

  final Widget child;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color shadowColor;
  final Color borderColor;
  final double buttonWidth, buttonHeight;

  @override
  Widget build(BuildContext context) {
    double effectiveButtonHeight =
        buttonHeight == 0
            ? MediaQuery.of(context).size.height * 0.0625
            : buttonHeight;

    return SizedBox(
      width: buttonWidth,
      height: effectiveButtonHeight,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shadowColor: shadowColor,
          elevation: 5,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(color: borderColor, width: 1.5),
          ),
        ),
        child: child,
      ),
    );
  }
}
