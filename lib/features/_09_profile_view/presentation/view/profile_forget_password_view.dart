import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo_implement.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/08_profile_forget_password_widgets/profile_forget_password_view_body.dart';

class ProfileForgetPasswordView extends StatelessWidget {
  const ProfileForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepo: AuthRepoImplement()),
      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        appBar: customAppBar(
          context,
          generalColor: kAppPrimaryBlueColor,
          text: 'Forget Password',
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        body: const CustomFlexibleWidget(
          child: ProfileForgetPasswordViewBody(),
        ),
      ),
    );
  }
}
