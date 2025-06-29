import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class JobDescription extends StatelessWidget {
  final String description;
  const JobDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AfacadTextStyles.textStyle16W600Black(context),
    );
  }
}
