import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../core/utilities/routes.dart';
import '../../../../_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_cubit.dart';
import '../../../../_03_auth_view/presentation/view_model/refresh_token_cubit/refresh_token_state.dart';
import 'logo_visibility_widget.dart';

class SplashView2Body extends StatefulWidget {
  const SplashView2Body({super.key}); // الكونستركتور الافتراضي

  @override
  State<SplashView2Body> createState() => _SplashView2BodyState(); // إنشاء حالة ال StatefulWidget
}

class _SplashView2BodyState extends State<SplashView2Body>
    with TickerProviderStateMixin {
  // الميكسين لتوفير vsync للأنيميشن كنترولرز
  late final AnimationController _rController; // كنترولر الأنيميشن لحرف R
  late final AnimationController _oController; // كنترولر الأنيميشن لحرف O
  late final AnimationController _aController; // كنترولر الأنيميشن لحرف A
  late final AnimationController
  _dmanController; // كنترولر الأنيميشن لكلمة DMAN

  late final Animation<Offset> _rAnimation; // حركة حرف R (Offset animation)
  late final Animation<Offset> _oAnimation; // حركة حرف O
  late final Animation<Offset> _aAnimation; // حركة حرف A
  late final Animation<Offset> _dmanAnimation; // حركة كلمة DMAN

  // متغيرات لتحديد ظهور كل حرف أو رسالة ترحيب بعد الانيميشن
  bool _showO = false;
  bool _showA = false;
  bool _showDman = false;
  bool _showWelcomeMessage = false;

  @override
  void initState() {
    super.initState();

    const duration = Duration(seconds: 1); // مدة كل أنيميشن 5 ثواني

    // إنشاء الكنترولرز لكل حرف بنفس المدة والزمن vsync
    _rController = AnimationController(vsync: this, duration: duration);
    _oController = AnimationController(vsync: this, duration: duration);
    _aController = AnimationController(vsync: this, duration: duration);
    _dmanController = AnimationController(vsync: this, duration: duration);

    // إعداد حركة حرف R - من اليسار خارج الشاشة (x = -1.5) للوضع الطبيعي (0,0)
    _rAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _rController, curve: Curves.easeOut));

    // إعداد حركة حرف O - من الأعلى خارج الشاشة (y = -1.5) للوضع الطبيعي
    _oAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _oController, curve: Curves.easeOut));

    // إعداد حركة حرف A - من الأسفل خارج الشاشة (y = 1.5) للوضع الطبيعي
    _aAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _aController, curve: Curves.easeOut));

    // إعداد حركة كلمة DMAN - من اليمين خارج الشاشة (x = 1.5) للوضع الطبيعي
    _dmanAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _dmanController, curve: Curves.easeOut));

    // بدء تسلسل الأنيميشن:
    // بعد انتهاء حركة حرف R، نُظهر حرف O وندخل أنيميشن حرف O، وهكذا...
    _rController.forward().then((_) {
      setState(() => _showO = true); // تفعيل ظهور حرف O
      _oController.forward().then((_) {
        setState(() => _showA = true); // تفعيل ظهور حرف A
        _aController.forward().then((_) {
          setState(() => _showDman = true); // تفعيل ظهور كلمة DMAN
          _dmanController.forward().then((_) {
            setState(
              () => _showWelcomeMessage = true,
            ); // ظهور رسالة الترحيب بعد الأنيميشن
            // استدعاء دالة لتحديث التوكن (refresh token) عبر ال Bloc
            BlocProvider.of<RefreshTokenCubit>(context).refreshTokenCubitFun();
          });
        });
      });
    });
  }

  @override
  void dispose() {
    // تنظيف الكنترولرز عند التخلص من ال StatefulWidget لتفادي تسرب الذاكرة
    _rController.dispose();
    _oController.dispose();
    _aController.dispose();
    _dmanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context); // الحصول على حجم شاشة الجهاز

    return BlocListener<RefreshTokenCubit, RefreshTokenStates>(
      listener: (context, state) {
        // التعامل مع حالات الـ Bloc الخاصة بالتحديث التوكن
        if (state is RefreshTokenSuccess) {
          log('From splash view user token = ${state.userTokensModel.token}');
          GoRouter.of(
            context,
          ).go(Routes.mainViewId); // التنقل لواجهة الرئيسية بعد نجاح التوكن
        } else if (state is RefreshTokenFailure) {
          log('From splash view user token = ${state.errorMessage}');
          GoRouter.of(context).go(
            Routes.onBoardingPageViewId,
          ); // الذهاب لصفحة الإعداد في حالة فشل التوكن
        } else {
          log('loooading!'); // حالة التحميل أو الحالات الأخرى
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // محاذاة عمودية في وسط الشاشة
          crossAxisAlignment:
              CrossAxisAlignment.center, // محاذاة أفقية في وسط الشاشة
          spacing:
              screenSize.height *
              .03, // ❌ خطأ: Column ما عندهاش خاصية spacing (مطلوب استخدام SizedBox)
          children: [
            // ويدجت يظهر الحروف مع الأنيميشن وظهور الحروف حسب المتغيرات
            LogoVisibilityWidget(
              rAnimation: _rAnimation,
              showO: _showO,
              oAnimation: _oAnimation,
              showA: _showA,
              aAnimation: _aAnimation,
              showDman: _showDman,
              dmanAnimation: _dmanAnimation,
            ),

            /// رسالة الترحيب التي تظهر بعد انتهاء جميع الأنيميشن
            if (_showWelcomeMessage)
              Text(
                'Your Journey Start Here 🚀🚀',
                textAlign: TextAlign.center,
                style: AfacadTextStyles.textStyle18W400Blue(
                  context,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
          ],
        ),
      ),
    );
  }
}
