import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos_implementation.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_view_body.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_bloc.dart';

import '../../../../core/helper/const_variables.dart';
import '../../../../core/utilities/custom_app_bar.dart';
import '../view_model/get_user_info_cubit/get_user_info_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  ProfileBloc(profileRepos: ProfileReposImplementation()),
        ),
        BlocProvider(
          create:
              (context) =>
                  GetUserInfoCubit(profileRepos: ProfileReposImplementation()),
        ),
      ],
      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        appBar: customAppBar(
          context,
          backgroundColor: kAppPrimaryWhiteColor,
          generalColor: kTextBlackPrimaryColor,
          text: 'Edit Profile',
          onPressed: () {
            GoRouter.of(context).pop(true);
          },
        ),
        body: const CustomFlexibleWidget(child: EditProfileViewBody()),
      ),
    );
  }
}
