import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/common_widgets/job_view_const_list.dart';

import '../../../../data/model/job_view_card_model.dart';

class SuggestedJobsTrackLocationSection extends StatelessWidget {
  SuggestedJobsTrackLocationSection({
    super.key,
    required this.image,
    required this.title,
    required this.company,
    required this.suggestedJobsItemModel,
    required this.location,
  });

  final String image;
  final String title, company, location;
  final JobViewCardModel suggestedJobsItemModel;

  final ValueNotifier<bool> iconFavouriteIsActive = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              width: screenWidth * 0.08, // 8% من عرض الشاشة
              height: screenWidth * 0.08,
              placeholderBuilder:
                  (context) => const CircularProgressIndicator(),
            ),
            SizedBox(width: screenWidth * 0.02), // مسافة بين الصورة والعناصر
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AfacadTextStyles.textStyle16W500Black(context),
                ),
                SizedBox(height: screenWidth * 0.01), // مسافة صغيرة بين النصوص
                Row(
                  children: [
                    Text(
                      company,
                      style: AfacadTextStyles.textStyle14W400Grey(context),
                    ),
                    SizedBox(width: screenWidth * 0.01), // مسافة صغيرة
                    Text(
                      location,
                      style: AfacadTextStyles.textStyle14W400Grey(context),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        buildValueListenableBuilderIcon(screenWidth),
      ],
    );
  }

  ValueListenableBuilder<bool> buildValueListenableBuilderIcon(
    double screenWidth,
  ) {
    return ValueListenableBuilder<bool>(
      valueListenable: iconFavouriteIsActive,
      builder: (context, isActive, child) {
        return IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () {
            iconFavouriteIsActive.value = !isActive;
            if (iconFavouriteIsActive.value) {
              JobViewConstList.favouriteCardList.add(suggestedJobsItemModel);
            } else {
              JobViewConstList.favouriteCardList.remove(suggestedJobsItemModel);
            }
          },
          icon: Icon(
            isActive ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            size: screenWidth * 0.06, // 6% من عرض الشاشة
            color: const Color(0xff131314),
          ),
        );
      },
    );
  }
}
