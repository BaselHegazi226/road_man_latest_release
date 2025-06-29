import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';

import 'job_details_user_job_details_item.dart';

class JobDetailsUserJobDetailsItemsSection extends StatelessWidget {
  const JobDetailsUserJobDetailsItemsSection({
    super.key,
    required this.jobViewCardModel,
  });
  final JobViewCardModel jobViewCardModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          spacing: 13,
          children: [
            JobDetailsUserJobDetailsItem(
              iconData: Icons.attach_money_outlined,
              title: jobViewCardModel.salaryType,
              subTitle: jobViewCardModel.salary,
            ),
            JobDetailsUserJobDetailsItem(
              iconData: Icons.work_history_outlined,
              title: 'Job Type',
              subTitle: jobViewCardModel.jobType,
            ),
          ],
        ),
        Row(
          spacing: 13,
          children: [
            JobDetailsUserJobDetailsItem(
              iconData: Icons.add_location_alt_outlined,
              title: 'Work Model',
              subTitle: jobViewCardModel.location,
            ),
            JobDetailsUserJobDetailsItem(
              iconData: FontAwesomeIcons.stairs,
              title: 'Level',
              subTitle: jobViewCardModel.jobLevel ?? 'suggested',
            ),
          ],
        ),
      ],
    );
  }
}
