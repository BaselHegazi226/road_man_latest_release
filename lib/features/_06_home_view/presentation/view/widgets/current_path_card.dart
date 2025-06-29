import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/core/utilities/gradients.dart';
import 'package:road_man_project/generated/assets.dart';

import '../../../../../core/helper/const_variables.dart';

class CurrentPathCard extends StatelessWidget {
  const CurrentPathCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.1725,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: Gradients.currentPathGradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left column with text and button
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.02,
                top: screenHeight * 0.01,
                bottom: screenHeight * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Current Path Name',
                    style: AfacadTextStyles.textStyle20W700Blue(
                      context,
                    ).copyWith(height: 1.5, letterSpacing: -0.38),
                  ),

                  // Subtitle
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Track goal',
                    style: AfacadTextStyles.textStyle16W500H150Black(
                      context,
                    ).copyWith(letterSpacing: 1.28),
                  ),

                  // Spacer to push button to bottom
                  const Spacer(),

                  // View Path Button
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: kQuizViewWhiteColor,
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    child: Text(
                      'View path',
                      style: AfacadTextStyles.textStyle14W500Black(
                        context,
                      ).copyWith(
                        color: kAppPrimaryBlueColor,
                        height: 1.50,
                        letterSpacing: -0.27,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                ],
              ),
            ),
          ),

          // Right side with decorative elements
          SizedBox(
            width: screenWidth * 0.39, // تقريبًا 156px لو العرض 400
            height: screenHeight * 0.215, // تقريبًا 172px لو الطول 800
            child: Stack(
              children: [
                // Main circle
                Positioned(
                  left: screenWidth * 0.0975, // 39px
                  top: screenHeight * 0.06875, // 55px
                  child: Container(
                    width: screenWidth * 0.2925, // 117px
                    height: screenWidth * 0.2925,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.06, 0.47),
                        end: Alignment(1.05, 0.47),
                        colors: [Color(0xFF9FADFF), Color(0xFF4C89FF)],
                      ),
                      shape: const OvalBorder(),
                    ),
                  ),
                ),

                // Image
                Positioned(
                  left: screenWidth * 0.1375, // 55px
                  bottom: 0,
                  child: Image.asset(Assets.manWithLapImage),
                ),

                // Decoration circles
                _buildDecorativeCircle(
                  screenWidth * 0.3225,
                  screenHeight * 0.00875,
                  screenWidth * 0.05,
                  const Color(0xFF8493EB),
                ), // 129, 7, 20
                _buildDecorativeCircle(
                  screenWidth * 0.145,
                  screenHeight * 0.015,
                  screenWidth * 0.025,
                  const Color(0xFF4C89FF),
                ), // 58, 12, 10
                _buildDecorativeCircle(
                  screenWidth * 0.0725,
                  screenHeight * 0.08375,
                  screenWidth * 0.04,
                  const Color(0xFFD1D7FF),
                ), // 29, 67, 16
                _buildDecorativeCircle(
                  screenWidth * 0.035,
                  screenHeight * 0.035,
                  screenWidth * 0.0375,
                  const Color(0xFF9FADFF),
                ), // 14, 28, 15
                _buildDecorativeCircle(
                  0,
                  screenHeight * 0.11625,
                  screenWidth * 0.02,
                  const Color(0xFF4C89FF),
                ), // 0, 93, 8
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDecorativeCircle(
    double left,
    double top,
    double size,
    Color color,
  ) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: ShapeDecoration(color: color, shape: const OvalBorder()),
      ),
    );
  }
}
