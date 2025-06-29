import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_otp_widgets/verification_otp_fields.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_otp_widgets/verify_otp_button.dart';

import 'otp_send_again_button.dart';

class VerificationOtpInputDataSection extends StatefulWidget {
  const VerificationOtpInputDataSection({super.key, required this.email});
  final String email;

  @override
  State<VerificationOtpInputDataSection> createState() =>
      _VerificationOtpInputDataSectionState();
}

class _VerificationOtpInputDataSectionState
    extends State<VerificationOtpInputDataSection> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool sendAgainIsLoading = false;
  bool buttonIsLoading = false;

  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      spacing: screenHeight * .03,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight * .015),
          child: VerificationOtpFields(
            formKey: _formKey,
            autoValidateMode: autoValidateMode,
            otpControllers: otpControllers,
            otpFocusNodes: otpFocusNodes,
          ),
        ),

        OtpSendAgainButton(
          email: widget.email,
          isLoading: sendAgainIsLoading,
          isOtherButtonLoading: buttonIsLoading,
          setLoading: (val) => setState(() => sendAgainIsLoading = val),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * .005),
          child: VerifyOtpButton(
            email: widget.email,
            otpControllers: otpControllers,
            formKey: _formKey,
            autoValidateMode: autoValidateMode,
            setAutoValidateMode:
                (val) => setState(() => autoValidateMode = val),
            isLoading: buttonIsLoading,
            isOtherButtonLoading: sendAgainIsLoading,
            setLoading: (val) => setState(() => buttonIsLoading = val),
          ),
        ),
      ],
    );
  }
}
