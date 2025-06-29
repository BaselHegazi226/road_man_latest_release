import '../../../../../../generated/assets.dart';
import '../../../../data/model/onboarding_item_model.dart';

class OnboardingConstClass {
  static const List<OnboardingItemModel> onboardingDataList = [
    OnboardingItemModel(
      image: Assets.onBoarding1Image,
      title1: 'Your personalized path',
      title2: 'starts here',
      subTitle:
          'Using AI, we design a unique learning path for you based on your goals and needs to achieve the best results',
    ),
    OnboardingItemModel(
      image: Assets.onBoarding2Image,
      title1: 'Learn from the best free',
      title2: 'and paid sources',
      subTitle:
          'We provide you with diverse and reliable sources that help you learn efficiently and professionally',
    ),
    OnboardingItemModel(
      image: Assets.onBoarding3Image,
      title1: 'Track your progress and',
      title2: 'prove your skills',
      subTitle:
          'With each level, we provide you with tests to measure your progress and guide you towards achieving your goals',
    ),
  ];
}
