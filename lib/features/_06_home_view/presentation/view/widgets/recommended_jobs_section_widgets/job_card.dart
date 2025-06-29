import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/generated/assets.dart';

import '../../../../data/model/job_model.dart';
import 'apply_button.dart';
import 'job_description.dart';
import 'job_tag.dart';

class JobCard extends StatelessWidget {
  final JobModel job;
  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: screenSize.width * 0.565, // 55% of screen width
      height: screenSize.height * 0.22, // 22% of screen height
      padding: EdgeInsets.all(screenSize.width * 0.02), // 2% of screen width
      decoration: BoxDecoration(
        color: kSecondlyLightWhiteColor,
        borderRadius: BorderRadius.circular(screenSize.width * 0.04), // 4%
        border: Border.all(width: 1, color: const Color(0xFF2352A1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                Assets.googleImage,
                width: screenSize.width * 0.08, // 8% of screen width
                height: screenSize.width * 0.08, // 8% of screen width
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.heart,
                  size: screenSize.width * .06,
                  color: kAppPrimaryBlackColor,
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height * 0.01), // 1% of screen height
          Row(
            children: [
              SizedBox(
                width: screenSize.width * 0.3,
                child: Text(
                  job.company ?? 'N/A',
                  style: AfacadTextStyles.textStyle12W700Black(context),
                ),
              ),
              SizedBox(width: screenSize.width * 0.01),
              Text(
                '30 days ago',
                style: InterTextStyles.textStyle12W400GreyHalfOpacity(
                  context: context,
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height * 0.01),
          JobDescription(description: job.title ?? 'No Title'),
          SizedBox(height: screenSize.height * 0.015),
          Wrap(
            spacing: screenSize.width * 0.02,
            runSpacing: screenSize.height * 0.01, // مسافة رأسية
            children: [
              if (job.jobType != null) JobTag(tag: job.jobType!), // نوع الوظيفة
              if (job.level != null) JobTag(tag: job.level!), // مستوى الوظيفة
            ],
          ),
          SizedBox(height: screenSize.height * 0.01),
          const Divider(height: 1, color: Color(0xff8A8C90)),
          SizedBox(height: screenSize.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenSize.width * 0.3,
                child: Text(
                  job.location ?? 'N/A',
                  style: AfacadTextStyles.textStyle14W400Grey(context),
                ),
              ),
              ApplyButton(onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
