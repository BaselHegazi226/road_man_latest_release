import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_05_main_view/presentation/view/widgets/main_view_widget/custom_bottom_nav_bar.dart';

import '../../../_06_home_view/home_view.dart';
import '../../../_07_learn_view/presentation/view/learning_path_view.dart';
import '../../../_08_job_view/presentation/view/job_view.dart';
import '../../../_09_profile_view/presentation/view/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> views = const [
    HomeView(),
    LearningPathView(),
    JobView(),
    ProfileView2(),
  ];

  void onTabSelected(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      body: views[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: onTabSelected,
      ),
    );
  }
}

//Bottom Nav Bar for ship item العنصر اللي كان على شكل سفينه
// class MainView extends StatefulWidget {
//   const MainView({super.key});
//
//   @override
//   State<MainView> createState() => _HomeViewBodyState();
// }
//
// class _HomeViewBodyState extends State<MainView> {
//   int currentIndex = 0;
//
//   final List<Widget> views = const [
//     HomeView(),
//     LearningPathView(),
//     JobView(),
//     ProfileView2(),
//   ];
//
//   void onTabSelected(int index) {
//     setState(() => currentIndex = index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kAppPrimaryWhiteColor,
//       body: views[currentIndex],
//       bottomNavigationBar: CustomBottomNavBar(
//         currentIndex: currentIndex,
//         onTap: onTabSelected,
//       ),
//     );
//   }
// }
