import 'package:flutter/material.dart';

import 'check_password_item.dart';

class TwoCheckPasswordItem extends StatelessWidget {
  const TwoCheckPasswordItem({
    super.key,
    required this.iconData1,
    required this.iconData2,
    required this.color1,
    required this.color2,
    required this.text1,
    required this.text2,
  });
  final IconData iconData1, iconData2;
  final Color color1, color2;
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CheckPasswordItem(
            iconData: iconData1,
            color: color1,
            text: text1,
          ),
        ),
        Expanded(
          child: CheckPasswordItem(
            iconData: iconData2,
            color: color2,
            text: text2,
          ),
        ),
      ],
    );
  }
}
