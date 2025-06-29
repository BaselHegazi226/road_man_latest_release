import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class CustomDrawer extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  const CustomDrawer({
    super.key,
    required this.body,
    this.backgroundColor = kDashboardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(backgroundColor: backgroundColor, child: body);
  }
}
