import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../helper/const_variables.dart';

class RecentJobsCardShimmerItem extends StatelessWidget {
  const RecentJobsCardShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: screenHeight * 0.16,
        padding: EdgeInsets.all(screenWidth * 0.02),
        margin: EdgeInsets.only(bottom: screenHeight * 0.02),
        decoration: BoxDecoration(
          color: kSecondlyDarkWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // عنوان الشركة والصورة
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.08,
                      height: screenWidth * 0.08,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Container(
                      width: screenWidth * 0.4,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.008),
                // السعر ونوع الوظيفة
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.2,
                      height: 10,
                      color: Colors.white,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Container(
                      width: screenWidth * 0.15,
                      height: 10,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            // الشركة والموقع والزمن
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.4,
                  height: 10,
                  color: Colors.white,
                ),
                Container(
                  width: screenWidth * 0.15,
                  height: 10,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
