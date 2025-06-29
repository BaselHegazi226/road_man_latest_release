import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/common_widgets/job_view_const_list.dart';

import '../../../../data/model/job_view_card_model.dart';

class RecentJobCardTitleSection extends StatelessWidget {
  final String title;
  final JobViewCardModel recentJobsCardModel;
  final ValueNotifier<bool> iconFavouriteIsActive = ValueNotifier(false);

  RecentJobCardTitleSection({
    super.key,
    required this.title,
    required this.recentJobsCardModel,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: AfacadTextStyles.textStyle20W600Black(context),
            overflow: TextOverflow.ellipsis,
          ),
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
              JobViewConstList.favouriteCardList.add(recentJobsCardModel);
            } else {
              JobViewConstList.favouriteCardList.remove(recentJobsCardModel);
            }
          },
          icon: Icon(
            isActive ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            size: screenWidth * 0.06, // 6% من عرض الشاشة
            color: kEditProfileIconColor,
          ),
        );
      },
    );
  }
}
