import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/custom_search_bar.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/search_bar_widgets/search_bar_section_icon.dart';

class JobViewSearchBarSection extends StatelessWidget {
  const JobViewSearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.045,
      margin: EdgeInsets.only(top: screenHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: screenWidth * 0.02,
        children: [
          Expanded(
            child: CustomSearchBar(
              searchBarEditingController: TextEditingController(),
              searchFocusNode: FocusNode(),
              hintText: 'Job title',
            ),
          ),
          SearchBarSectionIcon(iconData: Icons.tune_outlined),
        ],
      ),
    );
  }
}
