import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utilities/routes.dart';
import '../../onboarding_view.dart';

class OnboardingPageViewBody extends StatefulWidget {
  const OnboardingPageViewBody({super.key});

  @override
  State<OnboardingPageViewBody> createState() => _OnboardingPageViewBodyState();
}

class _OnboardingPageViewBodyState extends State<OnboardingPageViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      GoRouter.of(context).push(Routes.signInViewId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: 3,
        itemBuilder: (context, index) {
          return OnboardingView(
            index: index,
            currentPage: _currentPage,
            onNextPressed: _goToNextPage,
            onSkipPressed: () => GoRouter.of(context).push(Routes.signInViewId),
          );
        },
      ),
    );
  }
}
