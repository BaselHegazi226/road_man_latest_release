import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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

class NotificationsClearAllShimmerText extends StatelessWidget {
  const NotificationsClearAllShimmerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Text(
        'Clear All',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey[300], // اللون نفس لون الشيمر الأساسي
        ),
      ),
    );
  }
}
