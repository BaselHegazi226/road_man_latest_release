import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class CustomProfileTitle extends StatelessWidget {
  const CustomProfileTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: AfacadTextStyles.textStyle16W700Black(context));
  }
}
