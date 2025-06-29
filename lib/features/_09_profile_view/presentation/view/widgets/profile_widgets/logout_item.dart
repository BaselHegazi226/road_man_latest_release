import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class LogoutItem extends StatelessWidget {
  const LogoutItem({super.key, required this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      splashColor: kAppPrimaryBlueColor.withAlpha(15),
      borderRadius: BorderRadius.circular(screenWidth * .02),
      child: ListTile(
        leading: Icon(
          Icons.logout,
          size: screenWidth * .06,
          color: kAppPrimaryWrongColor,
        ),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * .02),
          child: Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: kAppPrimaryWrongColor,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: screenWidth * .05,
          color: kAppPrimaryWrongColor,
        ),
      ),
    );
  }
}
