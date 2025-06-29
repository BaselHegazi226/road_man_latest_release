import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class DashboardItemModel {
  final IconData prefixIcon;
  final String title;
  final Color iconColor, textColor;
  final String routeName;
  const DashboardItemModel({
    required this.routeName,
    required this.prefixIcon,
    required this.title,
    this.iconColor = kProfileIconColor,
    this.textColor = kTextBlackPrimaryColor,
  });
}
