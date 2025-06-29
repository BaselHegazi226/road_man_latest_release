import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingViewImageSection extends StatelessWidget {
  const OnBoardingViewImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * .055,
          bottom: screenHeight * .03,
        ),
        child: SvgPicture.asset(
          image,
          height: screenHeight * .48,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
