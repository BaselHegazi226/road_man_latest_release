import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_details_user_job_details_item_model.dart';

class ConstJobDetailsListClass {
  static final List<JobDetailsUserJobDetailsItemModel>
  jobDetailsUserJobDetailsItemModelList = [
    JobDetailsUserJobDetailsItemModel(
      iconData: Icons.attach_money_outlined,
      title: 'Salary (Monthly)',
      subTitle: '\$42 -\$48k',
      iconSize: 28,
    ),
    JobDetailsUserJobDetailsItemModel(
      iconData: Icons.work_history_outlined,
      title: 'Job Type',
      subTitle: 'part-time',
      iconSize: 28,
    ),
    JobDetailsUserJobDetailsItemModel(
      iconData: FontAwesomeIcons.cloud,
      title: 'Work Model',
      subTitle: 'Remote',
      iconSize: 24,
    ),
    JobDetailsUserJobDetailsItemModel(
      iconData: FontAwesomeIcons.chartLine,
      title: 'Level',
      subTitle: 'Beginner',
      iconSize: 24,
    ),
  ];
}
