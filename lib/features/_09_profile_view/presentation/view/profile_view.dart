import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos_implementation.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/profile_widgets/profile_view_body.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_bloc.dart';

class ProfileView1 extends StatelessWidget {
  const ProfileView1({super.key});

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
        appBar: customTitleAppbar(context, text: 'Profile'),
        body: const ProfileViewBody(),
      ),
    );
  }
}

class ProfileView2 extends StatelessWidget {
  const ProfileView2({super.key});

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
        appBar: customTitleAppbar(context, text: 'Profile'),
        body: const ProfileViewBody(),
      ),
    );
  }
}
