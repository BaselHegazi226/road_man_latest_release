import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../helper/const_variables.dart';

class ProgressSectionShimmer extends StatelessWidget {
  const ProgressSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: kSecondlyLightWhiteColor,
          borderRadius: BorderRadius.circular(screenSize.width * .04),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * .04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 👈 Left shimmer (3 rows + button)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Row(
                          children: [
                            Container(
                              width: screenSize.width * .06,
                              height: screenSize.width * .06,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: screenSize.width * .02),
                            Container(
                              width: screenSize.width * .35,
                              height: 12,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: screenSize.height * .02),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: screenSize.height * .035,
                      width: screenSize.width * .3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          screenSize.width * .02,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 👈 Right shimmer (progress circle)
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: screenSize.width * 0.248,
                  height: screenSize.width * 0.248,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
