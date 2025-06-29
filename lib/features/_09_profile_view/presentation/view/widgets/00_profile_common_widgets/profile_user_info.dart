import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import 'custom_image_profile.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({
    super.key,
    required this.email,
    required this.name,
    required this.photo,
  });

  final String email;
  final String name;
  final String photo;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * .04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageProfile(
            imageSize: screenWidth * .15,
            imagePath: photo, // ✅ تمرير المسار مباشرة
          ),
          SizedBox(width: screenWidth * .03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AfacadTextStyles.textStyle16W500Black(context)),
              Text(
                email,
                style: AfacadTextStyles.textStyle12W400Black(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
