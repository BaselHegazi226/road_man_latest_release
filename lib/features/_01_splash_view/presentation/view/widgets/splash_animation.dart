import 'package:flutter/material.dart';

class SplashAnimations {
  late final AnimationController rController;
  late final AnimationController oController;
  late final AnimationController aController;
  late final AnimationController dmanController;

  late final Animation<Offset> rAnimation;
  late final Animation<Offset> oAnimation;
  late final Animation<Offset> aAnimation;
  late final Animation<Offset> dmanAnimation;

  SplashAnimations({required TickerProvider vsync}) {
    const duration = Duration(seconds: 1);

    rController = AnimationController(vsync: vsync, duration: duration);
    oController = AnimationController(vsync: vsync, duration: duration);
    aController = AnimationController(vsync: vsync, duration: duration);
    dmanController = AnimationController(vsync: vsync, duration: duration);

    rAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: rController, curve: Curves.easeOut));

    oAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: oController, curve: Curves.easeOut));

    aAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: aController, curve: Curves.easeOut));

    dmanAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: dmanController, curve: Curves.easeOut));
  }

  void dispose() {
    rController.dispose();
    oController.dispose();
    aController.dispose();
    dmanController.dispose();
  }
}
