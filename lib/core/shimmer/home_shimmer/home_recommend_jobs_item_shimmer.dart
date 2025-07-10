import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../helper/const_variables.dart';

class HomeRecommendedJobsItemShimmer extends StatelessWidget {
  const HomeRecommendedJobsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: screenSize.width * 0.565,
        height: screenSize.height * 0.22,
        padding: EdgeInsets.all(screenSize.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenSize.width * 0.04),
          border: Border.all(width: 1, color: kAppPrimaryBlueColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصف العلوي (اللوجو + أيقونة)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenSize.width * 0.08,
                  height: screenSize.width * 0.08,
                  color: Colors.grey,
                ),
                Container(
                  width: screenSize.width * 0.06,
                  height: screenSize.width * 0.06,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              width: screenSize.width * 0.3,
              height: 12,
              color: Colors.grey,
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              width: screenSize.width * 0.4,
              height: 14,
              color: Colors.grey,
            ),
            SizedBox(height: screenSize.height * 0.015),
            Row(
              children: [
                Container(
                  width: screenSize.width * 0.2,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.02),
                Container(
                  width: screenSize.width * 0.2,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.015),
            Container(height: 1, color: Colors.grey),
            SizedBox(height: screenSize.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenSize.width * 0.2,
                  height: 14,
                  color: Colors.grey,
                ),
                Container(
                  width: screenSize.width * 0.18,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
