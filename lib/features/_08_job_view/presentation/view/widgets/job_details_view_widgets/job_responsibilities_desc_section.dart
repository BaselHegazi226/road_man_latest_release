import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_desc_title.dart';

import 'job_responsibilities_desc_Items_section.dart';

class JobResponsibilitiesDescSection extends StatelessWidget {
  const JobResponsibilitiesDescSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JobDetailsDescTitle(title: 'Job Responsibilities'),
        JobResponsibilitiesDescItemsSection(),
      ],
    );
  }
}
