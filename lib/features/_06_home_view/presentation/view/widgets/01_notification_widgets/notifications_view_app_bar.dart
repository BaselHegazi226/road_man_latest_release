import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

AppBar notificationViewAppbar(BuildContext context) {
  final double screenWidth = MediaQuery.sizeOf(context).width;
  return AppBar(
    backgroundColor: kAppPrimaryWhiteColor,
    title: Text(
      'Notification',
      style: AfacadTextStyles.textStyle20W500Blue(
        context,
      ).copyWith(color: kAppPrimaryBlackColor),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      icon: Icon(CupertinoIcons.back, color: kEditProfileIconColor),
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.only(right: screenWidth * .04),
        onPressed: () {},
        icon: Icon(
          Icons.delete_outline,
          size: 28,
          color: kEditProfileIconColor,
        ),
      ),
    ],
  );
}
