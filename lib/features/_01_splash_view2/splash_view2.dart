import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_01_splash_view2/presentation/view/widgets/splash_view2_body.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo_implement.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_cubit.dart';

class SplashView2 extends StatefulWidget {
  const SplashView2({super.key});

  @override
  State<SplashView2> createState() => _SplashView2State();
}

class _SplashView2State extends State<SplashView2>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RefreshTokenCubit(authRepo: AuthRepoImplement()),
      child: Scaffold(backgroundColor: Colors.white, body: SplashView2Body()),
    );
  }
}
