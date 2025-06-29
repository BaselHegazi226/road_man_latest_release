import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/07_change_password_widgets/change_password_view_body.dart';

import '../../data/repos/profile_repos/profile_repos_implementation.dart';
import '../view_model/profile_blocs/profile_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileBloc(profileRepos: ProfileReposImplementation()),
      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        appBar: customAppBar(
          context,
          text: 'Change Password',
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        body: const CustomFlexibleWidget(child: ChangePasswordViewBody()),
      ),
    );
  }
}
