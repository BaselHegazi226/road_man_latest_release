import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo_implement.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_otp_widgets/verification_otp_view_body.dart';

import '../../../../core/helper/const_variables.dart';

class VerificationOtpView extends StatelessWidget {
  const VerificationOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = GoRouterState.of(context).extra as String;
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        context,
        generalColor: kAppPrimaryBlueColor,
        text: 'Verification Otp',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(authRepo: AuthRepoImplement()),
        child: CustomFlexibleWidget(
          child: VerificationOtpViewBody(email: email),
        ),
      ),
    );
  }
}
