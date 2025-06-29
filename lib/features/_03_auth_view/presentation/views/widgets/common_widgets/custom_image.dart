import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image, this.imageBottomPadding});

  final String image;
  final double? imageBottomPadding;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.03, // 6% من الطول بدل 24 بكسل
        bottom:
            imageBottomPadding ??
            screenHeight * 0.07, // 7% من الطول بدل 58 بكسل
      ),
      child: SvgPicture.asset(
        image,
        height: screenHeight * 0.4, // 40% من الطول بدل 350 بكسل
        width: screenWidth * 0.8, // 80% من العرض بدل 350 بكسل
        fit: BoxFit.contain,
      ),
    );
  }
}
