import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../generated/assets.dart';

class JobDetailsGoogleIcon extends StatelessWidget {
  const JobDetailsGoogleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03), // نسبة 3% من العرض
      decoration: BoxDecoration(
        color: const Color(0xffF4F5F8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(40),
            blurRadius: screenWidth * 0.02, // نسبة 2% من العرض
            offset: const Offset(0, 4), // ثابت لتحسين الظل
          ),
        ],
      ),
      child: SvgPicture.asset(
        Assets.jobGoogleIcon,
        height: screenWidth * 0.1, // نسبة 10% من العرض
        width: screenWidth * 0.1,
      ),
    );
  }
}
