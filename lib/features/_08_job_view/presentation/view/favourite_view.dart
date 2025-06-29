import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/favourite_view_widgets/favourite_view_app_bar.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/favourite_view_widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: favouriteViewAppBar(context),
      body: const FavouriteViewBody(),
    );
  }
}
