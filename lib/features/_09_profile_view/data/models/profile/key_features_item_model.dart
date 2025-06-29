import 'package:flutter/material.dart';

class KeyFeaturesItemModel {
  final IconData iconData;
  final String title;
  const KeyFeaturesItemModel({
    this.iconData = Icons.check_box_rounded,
    required this.title,
  });
}
