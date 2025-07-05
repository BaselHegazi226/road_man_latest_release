import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_01_splash_view2/presentation/view/widgets/splash_animation.dart';
import 'package:road_man_project/features/_01_splash_view2/presentation/view/widgets/welcome_text_widget.dart';

import '../../../../_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_cubit.dart';
import '../../../../_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_state.dart';
import 'logo_visibility_widget.dart';

class SplashView2Body extends StatefulWidget {
  const SplashView2Body({super.key});

  @override
  State<SplashView2Body> createState() => _SplashView2BodyState();
}

class _SplashView2BodyState extends State<SplashView2Body>
    with TickerProviderStateMixin {
  late final SplashAnimations _animations;

  bool _showO = false;
  bool _showA = false;
  bool _showDman = false;
  bool _showWelcomeMessage = false;

  @override
  void initState() {
    super.initState();
    _animations = SplashAnimations(vsync: this);
    startAnimationSequence();
  }

  void startAnimationSequence() {
    _animations.rController.forward().then((_) {
      setState(() => _showO = true);
      _animations.oController.forward().then((_) {
        setState(() => _showA = true);
        _animations.aController.forward().then((_) {
          setState(() => _showDman = true);
          _animations.dmanController.forward().then((_) {
            setState(() => _showWelcomeMessage = true);
            BlocProvider.of<RefreshTokenCubit>(context).refreshTokenCubitFun();
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _animations.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return BlocListener<RefreshTokenCubit, RefreshTokenStates>(
      listener: (context, state) {
        if (state is RefreshTokenSuccess) {
          log('Token: ${state.userTokensModel.token}');
          GoRouter.of(context).go(Routes.mainViewId);
        } else if (state is RefreshTokenFailure) {
          log('Error: ${state.errorMessage}');
          GoRouter.of(context).go(Routes.onBoardingPageViewId);
        } else {
          log('Loading...');
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoVisibilityWidget(
              rAnimation: _animations.rAnimation,
              showO: _showO,
              oAnimation: _animations.oAnimation,
              showA: _showA,
              aAnimation: _animations.aAnimation,
              showDman: _showDman,
              dmanAnimation: _animations.dmanAnimation,
            ),
            SizedBox(height: screenHeight * .03),
            if (_showWelcomeMessage) const WelcomeTextWidget(),
          ],
        ),
      ),
    );
  }
}
