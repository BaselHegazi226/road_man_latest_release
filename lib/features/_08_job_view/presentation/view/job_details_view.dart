import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_app_bar.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_view_body.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final jobViewCardModel =
        GoRouterState.of(context).extra as JobViewCardModel;

    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kAppPrimaryBlueColor,
      appBar: jobDetailsAppbar(context),
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.07), // بدلًا من `64`
        child: JobDetailsViewBody(jobDetailsCardModel: jobViewCardModel),
      ),
    );
  }
}
