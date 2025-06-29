import 'package:flutter/material.dart';

import 'change_password_view_input_data_section.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * .04),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * .06),
            ChangePasswordViewInputDataSection(),
          ],
        ),
      ),
    );
  }
}
