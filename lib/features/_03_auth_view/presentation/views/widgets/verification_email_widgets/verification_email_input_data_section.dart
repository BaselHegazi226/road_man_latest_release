import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_email_widgets/verification_email_fields.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_email_widgets/verify_email_button.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_email_widgets/verify_email_send_again_button.dart';

class VerificationEmailInputDataSection extends StatefulWidget {
  const VerificationEmailInputDataSection({super.key, required this.email});
  final String email;

  @override
  State<VerificationEmailInputDataSection> createState() =>
      _VerificationEmailInputDataSectionState();
}

class _VerificationEmailInputDataSectionState
    extends State<VerificationEmailInputDataSection> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());
  bool isLoading = false;
  bool sendAgainIsLoading = false;

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
          child: VerificationEmailFields(
            formKey: _formKey,
            autoValidateMode: autoValidateMode,
            otpControllers: otpControllers,
            otpFocusNodes: otpFocusNodes,
          ),
        ),
        VerifyEmailSendAgainButton(
          isLoading: isLoading,
          sendAgainIsLoading: sendAgainIsLoading,
          otpControllers: otpControllers,
          email: widget.email,
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * .005),
          child: VerifyEmailButton(
            formKey: _formKey,
            otpControllers: otpControllers,
            email: widget.email,
            autoValidateMode: autoValidateMode,
            setAutoValidateMode:
                (mode) => setState(() => autoValidateMode = mode),
            isLoading: isLoading,
            sendAgainIsLoading: sendAgainIsLoading,
            setLoading: (value) => setState(() => isLoading = value),
          ),
        ),
      ],
    );
  }
}
