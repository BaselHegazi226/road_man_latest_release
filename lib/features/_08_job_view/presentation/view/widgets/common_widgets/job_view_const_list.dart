import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';

import '../../../../../../generated/assets.dart';

class JobViewConstList {
  static const List<JobViewCardModel> suggestedJobsItemModelList = [
    JobViewCardModel(
      jobLevel: 'Advanced Level',
      title: 'Content Marketing',
      salary: '\$42- \$48k',
      salaryType: ' /monthly',
      jobType: 'Part_Time',
      company: 'Google',
      location: 'Cairo | Egypt',
      logo: Assets.jobGoogleIcon,
    ),
    JobViewCardModel(
      jobLevel: 'Advanced Level',
      title: 'Flutter Developer',
      salary: '\$1000- \$1500k',
      salaryType: ' /monthly',
      jobType: 'Full_Time',
      company: 'Google',
      location: 'Cairo | Egypt',
      logo: Assets.jobGoogleIcon,
    ),
  ];
  // Dummy Data
  static const List<JobViewCardModel> recentJobsCardItemModelList = [
    JobViewCardModel(
      timeLeft: '15 days left',
      title: 'Content Marketing',
      salary: '\$42 - \$48k',
      salaryType: ' /monthly',
      jobType: 'Full-Time',
      company: 'LinkedIn',
      location: 'Remote',
      logo: Assets.jobGoogleIcon,
    ),
    JobViewCardModel(
      timeLeft: '30 days left',
      title: 'UI/UX Designer',
      salary: '\$50 - \$60k ',
      salaryType: ' /year',
      jobType: 'Part-Time',
      company: 'Google',
      location: 'San Francisco',
      logo: Assets.jobGoogleIcon,
    ),
  ];

  static List<JobViewCardModel> favouriteCardList = [];
}
