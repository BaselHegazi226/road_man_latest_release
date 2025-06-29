import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import 'custom_tab_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: kAppPrimaryBlueColor,
          buttonBackgroundColor: kAppPrimaryBlueColor,
          height: min(screenSize.height * 0.082, 75.0),
          index: currentIndex,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          items: List.generate(4, (index) {
            return CustomTabBarItem(
              index: index,
              isSelected: currentIndex == index,
            );
          }),
          onTap: (index) => onTap(index),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: screenSize.height * .005,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return Container(
                width: screenSize.width / 4,
                alignment: Alignment.center,
                child:
                    currentIndex == index
                        ? Text(
                          CustomTabBarItem.getText(index),
                          style: AfacadTextStyles.textStyle14W500White(
                            context,
                          ).copyWith(height: 1.5, letterSpacing: -0.266),
                        )
                        : null,
              );
            }),
          ),
        ),
      ],
    );
  }
}

//Bottom Nav Bar for ship item العنصر اللي كان على شكل سفينه
// class CustomBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const CustomBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 900),
//       color: Colors.transparent,
//       curve: Curves.bounceOut,
//       child: Container(
//         height: screenHeight * 0.08,
//         decoration: BoxDecoration(
//           color: kAppPrimaryBlueColor,
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(screenWidth * .08),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(4, (index) {
//             return CustomTabBarItem(
//               index: index,
//               isSelected: currentIndex == index,
//               onTap: () => onTap(index),
//               screenWidth: screenWidth,
//               screenHeight: screenHeight,
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
