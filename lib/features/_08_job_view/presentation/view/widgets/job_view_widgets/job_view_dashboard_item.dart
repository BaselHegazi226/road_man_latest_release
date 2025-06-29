import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../_05_main_view/data/model/dashboard_item_model.dart';

class JobViewDashboardItem extends StatelessWidget {
  const JobViewDashboardItem({
    super.key,
    required this.customDrawerItemModel,
    required this.onTap,
  });
  final DashboardItemModel customDrawerItemModel;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: customDrawerItemModel.routeName.isNotEmpty ? onTap : null,
      child: ListTile(
        leading: Icon(
          customDrawerItemModel.prefixIcon,
          size: 24,
          color: kProfileIconColor,
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            customDrawerItemModel.title,
            style: AfacadTextStyles.textStyle16W500H150Black(context),
          ),
        ),
      ),
    );
  }
}
