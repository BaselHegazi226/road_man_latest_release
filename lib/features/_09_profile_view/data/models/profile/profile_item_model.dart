import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class ProfileItemModel {
  final IconData prefixIcon;
  final String title;
  final Color iconColor, textColor;
  final String routeName;
  const ProfileItemModel({
    required this.prefixIcon,
    required this.title,
    this.routeName = '',
    this.iconColor = kProfileIconColor,
    this.textColor = kTextBlackPrimaryColor,
  });
}
