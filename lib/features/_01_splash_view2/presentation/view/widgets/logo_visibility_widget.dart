import 'package:flutter/material.dart';
import 'package:road_man_project/generated/assets.dart';

class LogoVisibilityWidget extends StatelessWidget {
  const LogoVisibilityWidget({
    super.key,
    required Animation<Offset> rAnimation,
    required bool showO,
    required Animation<Offset> oAnimation,
    required bool showA,
    required Animation<Offset> aAnimation,
    required bool showDman,
    required Animation<Offset> dmanAnimation,
  }) : _rAnimation = rAnimation,
       _showO = showO,
       _oAnimation = oAnimation,
       _showA = showA,
       _aAnimation = aAnimation,
       _showDman = showDman,
       _dmanAnimation = dmanAnimation;

  final Animation<Offset> _rAnimation;
  final bool _showO;
  final Animation<Offset> _oAnimation;
  final bool _showA;
  final Animation<Offset> _aAnimation;
  final bool _showDman;
  final Animation<Offset> _dmanAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: MediaQuery.sizeOf(context).width * .35),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// R
          SlideTransition(
            position: _rAnimation,
            child: Image.asset(Assets.logoRImage),
          ),

          /// O
          Positioned(
            top: -5,
            left: 64,
            child: Visibility(
              visible: _showO,
              child: SlideTransition(
                position: _oAnimation,
                child: Image.asset(Assets.logoOImage),
              ),
            ),
          ),

          /// A
          Positioned(
            bottom: -10,
            left: 92,
            child: Visibility(
              visible: _showA,
              child: SlideTransition(
                position: _aAnimation,
                child: Image.asset(Assets.logoAImage),
              ),
            ),
          ),

          /// Dman
          Positioned(
            bottom: -5,
            left: 170,
            child: Visibility(
              visible: _showDman,
              child: SlideTransition(
                position: _dmanAnimation,
                child: Image.asset(Assets.logoDManImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
