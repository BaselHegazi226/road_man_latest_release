import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthImageSection extends StatelessWidget {
  const AuthImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 42),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.464,
            height: (screenWidth * 0.464) * (184 / 170),
            child: SvgPicture.asset(image, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
