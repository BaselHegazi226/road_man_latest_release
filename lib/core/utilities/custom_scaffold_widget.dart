import 'package:flutter/material.dart';

import '../helper/const_variables.dart';

class CustomScaffoldWidget extends StatelessWidget {
  const CustomScaffoldWidget({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryBlueColor,
      resizeToAvoidBottomInset: true,
      body: body,
    );
  }
}
