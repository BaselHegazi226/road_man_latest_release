import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_desc_title.dart';

import 'job_details_desc_item.dart';

class JobDetailsDescSection extends StatelessWidget {
  const JobDetailsDescSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        JobDetailsDescTitle(title: 'Job Details'),
        JobDetailsDescItem(),
      ],
    );
  }
}
