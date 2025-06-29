import 'package:flutter/material.dart';

import 'job_responsibilities_desc_item.dart';

class JobResponsibilitiesDescItemsSection extends StatelessWidget {
  const JobResponsibilitiesDescItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        JobResponsibilitiesDescItem(
          text:
              'Improving user experience and ensuring design compatibility with different devices (Responsive Design).',
        ),
        JobResponsibilitiesDescItem(
          text:
              'Handling API calls and interacting with data through (RESTful APIs / GraphQL).',
        ),
        JobResponsibilitiesDescItem(
          text:
              'Following modern UI/UX standards to ensure an optimal user experience',
        ),
      ],
    );
  }
}
