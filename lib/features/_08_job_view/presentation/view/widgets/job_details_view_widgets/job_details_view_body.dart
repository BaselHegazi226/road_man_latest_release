import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_component_section.dart';

import 'job_details_goole_icon.dart';

class JobDetailsViewBody extends StatelessWidget {
  const JobDetailsViewBody({super.key, required this.jobDetailsCardModel});
  final JobViewCardModel jobDetailsCardModel;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kAppPrimaryWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              screenWidth * 0.12,
            ), // كان 48، الآن نسبة 12% من العرض
            topRight: Radius.circular(screenWidth * 0.12),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
          ), // كان 16، الآن 4% من العرض
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: -screenHeight * 0.035, // كان -32، الآن نسبة من الارتفاع
                child: JobDetailsGoogleIcon(),
              ),
              Positioned(
                top: screenHeight * 0.05, // كان 46، الآن نسبة من الارتفاع
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomFlexibleWidget(
                  child: JobDetailsComponentSection(
                    jobDetailsCardModel: jobDetailsCardModel,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
