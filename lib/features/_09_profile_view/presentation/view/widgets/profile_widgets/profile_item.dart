import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../../../../data/models/profile/profile_item_model.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.profileItemModel,
    required this.onTap,
  });
  final ProfileItemModel profileItemModel;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: profileItemModel.routeName.isNotEmpty ? onTap : null,
      splashColor: kAppPrimaryBlueColor.withAlpha(15),
      borderRadius: BorderRadius.circular(screenWidth * .02),
      child: ListTile(
        leading: Icon(
          profileItemModel.prefixIcon,
          size: screenWidth * .06,
          color: profileItemModel.iconColor,
        ),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * .02),
          child: Text(
            profileItemModel.title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: profileItemModel.textColor,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: screenWidth * .05,
          color: profileItemModel.iconColor,
        ),
      ),
    );
  }
}
