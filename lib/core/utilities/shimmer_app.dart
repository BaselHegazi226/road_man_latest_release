import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../helper/const_variables.dart';

class ProfileUserInfoShimmer extends StatelessWidget {
  const ProfileUserInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.grey.shade300,
      child: Row(
        spacing: 16,
        children: [
          // ✅ صورة بروفايل وهمية باستخدام CircleAvatar
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white, // لازم تكون نفس لون الـ base
          ),
          // ✅ النصين الرأسين
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Container(width: 120, height: 16, color: Colors.white),

              Container(width: 80, height: 14, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressShimmerSection extends StatelessWidget {
  const ProgressShimmerSection({super.key});

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

class HomeRecommendedJobsShimmer extends StatelessWidget {
  const HomeRecommendedJobsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: screenSize.width * .05),
          child: HomeRecommendedJobsShimmerItem(),
        );
      },
    );
  }
}

class HomeRecommendedJobsShimmerItem extends StatelessWidget {
  const HomeRecommendedJobsShimmerItem({super.key});

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

class RecentJobsCardShimmer extends StatelessWidget {
  const RecentJobsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,

      itemBuilder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.01),
          child: RecentJobsCardShimmerItem(),
        );
      },
    );
  }
}

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

class NotificationViewItemShimmer extends StatelessWidget {
  const NotificationViewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        height: screenHeight * 0.103,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(screenWidth * 0.06),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth * 0.078,
              height: screenWidth * 0.078,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.018,
                    color: Colors.white,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.014,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationViewShimmer extends StatelessWidget {
  const NotificationViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: NotificationViewItemShimmer(),
        ),
        childCount: 6, // عدد الـ shimmer اللي يظهر
      ),
    );
  }
}
