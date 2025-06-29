import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/utilities/custom_text_form_field_otp.dart';

class VerificationEmailFields extends StatelessWidget {
  const VerificationEmailFields({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
    required this.otpControllers,
    required this.otpFocusNodes,
  });

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  final List<TextEditingController> otpControllers;
  final List<FocusNode> otpFocusNodes;

  void _onOtpChanged(BuildContext context, String value, int index) {
    if (value.isNotEmpty) {
      if (index < otpControllers.length - 1) {
        FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
      } else {
        otpFocusNodes[index].unfocus();
      }
    }
  }

  void _onPaste(String value) {
    if (value.length == otpControllers.length) {
      for (int i = 0; i < otpControllers.length; i++) {
        otpControllers[i].text = value[i];
      }
      otpFocusNodes.last.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: GestureDetector(
        onLongPress: () async {
          ClipboardData? clipboardData = await Clipboard.getData(
            Clipboard.kTextPlain,
          );
          if (clipboardData != null) {
            _onPaste(clipboardData.text ?? '');
          }
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              otpControllers.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * .01,
                ),
                child: CustomTextFormFieldOtp(
                  textEditingController: otpControllers[index],
                  focusNode: otpFocusNodes[index],
                  onChanged: (value) => _onOtpChanged(context, value, index),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
