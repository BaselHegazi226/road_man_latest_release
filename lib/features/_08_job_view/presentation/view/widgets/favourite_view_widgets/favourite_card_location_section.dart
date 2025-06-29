import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/const_variables.dart';

class FavouriteCardLocationSection extends StatelessWidget {
  const FavouriteCardLocationSection({
    super.key,
    required this.company,
    required this.location,
    required this.timeLeft,
  });
  final String company;
  final String location;
  final String timeLeft;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 16,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: kAppPrimaryBlueColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                FontAwesomeIcons.linkedinIn,
                color: kAppPrimaryWhiteColor,
                size: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  company,
                  style: AfacadTextStyles.textStyle14W400Grey(context),
                ),
                Text(
                  location,
                  style: AfacadTextStyles.textStyle14W400Grey(context),
                ),
              ],
            ),
          ],
        ),
        Text(timeLeft, style: AfacadTextStyles.textStyle12W400Grey(context)),
      ],
    );
  }
}
