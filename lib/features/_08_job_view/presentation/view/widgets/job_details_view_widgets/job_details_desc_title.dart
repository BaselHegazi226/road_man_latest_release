import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class JobDetailsDescTitle extends StatelessWidget {
  const JobDetailsDescTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: AfacadTextStyles.textStyle20W600Black(context));
  }
}
