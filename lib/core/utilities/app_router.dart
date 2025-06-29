import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_01_splash_view2/splash_view2.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/forget_password_view.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/reset_password_view.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/verification_otp_view.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/learning_path_view.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/lesson_view.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/quiz_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/favourite_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/job_details_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/job_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/notification_view.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/change_password_view.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/profile_forget_password_view.dart';

import '../../features/_02_onboarding_view/presentation/view/onboarding_page_view.dart';
import '../../features/_03_auth_view/presentation/views/sign_in_view.dart';
import '../../features/_03_auth_view/presentation/views/sign_up_view.dart';
import '../../features/_03_auth_view/presentation/views/verification_email_view.dart';
import '../../features/_04_questionnaire_view/presentation/views/questionnaire_view.dart';
import '../../features/_05_main_view/presentation/view/main_view.dart';
import '../../features/_09_profile_view/presentation/view/about_app_view.dart';
import '../../features/_09_profile_view/presentation/view/edit_profile_view.dart';
import '../../features/_09_profile_view/presentation/view/faq_view.dart';
import '../../features/_09_profile_view/presentation/view/learning_preferences_view.dart';
import '../../features/_09_profile_view/presentation/view/privacy_policy_view.dart';
import '../../features/_09_profile_view/presentation/view/profile_view.dart';
import '../../features/_09_profile_view/presentation/view/settings_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.splashView2Id,
    routes: [
      GoRoute(
        path: Routes.splashView2Id,
        builder: (context, state) => const SplashView2(),
      ),
      GoRoute(
        path: Routes.onBoardingPageViewId,
        builder: (context, state) => const OnboardingPageView(),
      ),
      GoRoute(
        path: Routes.questionnaireViewId,
        builder: (context, state) => const QuestionnaireView(),
      ),
      GoRoute(
        path: Routes.signInViewId,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: Routes.signUpViewId,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: Routes.forgetPasswordViewId,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: Routes.resetPasswordViewId,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: Routes.verificationOtpViewId,
        builder: (context, state) => const VerificationOtpView(),
      ),
      GoRoute(
        path: Routes.verificationEmailViewId,
        builder: (context, state) => const VerificationEmailView(),
      ),
      GoRoute(
        path: Routes.mainViewId,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: Routes.profileViewId,
        builder: (context, state) => const ProfileView1(),
      ),
      GoRoute(
        path: Routes.editProfileViewId,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: Routes.changePasswordViewId,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: Routes.profileForgetPasswordViewId,
        builder: (context, state) => const ProfileForgetPasswordView(),
      ),
      GoRoute(
        path: Routes.settingsViewId,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: Routes.aboutAppViewId,
        builder: (context, state) => const AboutAppView(),
      ),
      GoRoute(
        path: Routes.privacyPolicyViewId,
        builder: (context, state) => const PrivacyPolicyView(),
      ),
      GoRoute(
        path: Routes.faqViewId,
        builder: (context, state) => const FAQView(),
      ),
      GoRoute(
        path: Routes.jobViewId,
        builder: (context, state) => const JobView(),
      ),
      GoRoute(
        path: Routes.jobDetailsViewId,
        builder: (context, state) => const JobDetailsView(),
      ),
      GoRoute(
        path: Routes.favouriteViewId,
        builder: (context, state) => const FavouriteView(),
      ),
      GoRoute(
        path: Routes.notificationJobViewId,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: Routes.learningPathViewId,
        builder: (context, state) => const LearningPathView(),
      ),
      GoRoute(
        path: Routes.learningPreferencesViewId,
        builder: (context, state) => const LearningPreferencesView(),
      ),
      GoRoute(
        path: Routes.lessonViewId,
        builder: (context, state) => const LessonView(),
      ),
      GoRoute(
        path: Routes.quizViewId,
        builder: (context, state) => const QuizView(),
      ),
    ],
  );
}
