import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/helper/const_variables.dart';

class WorkingTimeItemArrow extends StatelessWidget {
  const WorkingTimeItemArrow({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final double iconSize =
        MediaQuery.of(context).size.width * 0.05; // حجم ديناميكي للأيقونة

    return Material(
      color: Colors.transparent, // حتى لا يظهر لون خلفي غير مرغوب
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(iconSize * 0.65), // لجعل الحجم متناسق
          decoration: const BoxDecoration(
            color: kAppPrimaryBlueColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            FontAwesomeIcons.arrowRight,
            color: kAppPrimaryWhiteColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
