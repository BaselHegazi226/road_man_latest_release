import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/custom_scaffold_widget.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/social_auth_bloc/social_auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_view_body.dart';

import '../../data/repos/auth_repo_implement.dart';
import '../view_model/auth_bloc/auth_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return AuthBloc(authRepo: AuthRepoImplement());
          },
        ),
        BlocProvider(
          create: (context) {
            return SocialAuthBloc(authRepo: AuthRepoImplement());
          },
        ),
      ],
      child: const CustomScaffoldWidget(body: SignInViewBody()),
    );
  }
}
