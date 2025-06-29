import 'package:flutter/material.dart';

import 'job_details_desc_section.dart';
import 'job_responsibilities_desc_section.dart';

class JobDetailsDescription extends StatelessWidget {
  const JobDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [JobDetailsDescSection(), JobResponsibilitiesDescSection()],
    );
  }
}
