import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class FavouriteCardTitleSection extends StatefulWidget {
  const FavouriteCardTitleSection({super.key, required this.title});
  final String title;
  @override
  State<FavouriteCardTitleSection> createState() =>
      _FavouriteCardTitleSectionState();
}

class _FavouriteCardTitleSectionState extends State<FavouriteCardTitleSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: AfacadTextStyles.textStyle20W600Black(context),
        ),
        Icon(CupertinoIcons.heart_fill, size: 24, color: kEditProfileIconColor),
      ],
    );
  }
}
