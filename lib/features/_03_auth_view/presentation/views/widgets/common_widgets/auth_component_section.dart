import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'auth_title.dart';

class AuthComponentSection extends StatelessWidget {
  const AuthComponentSection({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kSecondlyDarkWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.08), // بدل 32px
            topRight: Radius.circular(screenWidth * 0.08), // بدل 32px
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06, // بدل 24px
                vertical: screenHeight * 0.02, // بدل 16px
              ),
              child: AuthTitle(title: title),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondlyLightWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.08), // بدل 32px
                    topRight: Radius.circular(screenWidth * 0.08), // بدل 32px
                  ),
                ),
                child: CustomFlexibleWidget(child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
