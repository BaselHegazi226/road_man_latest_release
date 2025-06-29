import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/social_auth_bloc/social_auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/social_auth_bloc/social_auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/social_auth_bloc/social_auth_states.dart';

import '../../../../../../core/utilities/dialogState.dart';
import '../../../../../../core/utilities/routes.dart';

class SocialAuthCardSection extends StatefulWidget {
  const SocialAuthCardSection({
    super.key,
    required this.authButtonIsLoading,
    required this.onSocialAuthLoadingChanged,
    required this.title,
  });
  final String title;
  final bool authButtonIsLoading;
  final ValueChanged<bool> onSocialAuthLoadingChanged;

  @override
  State<SocialAuthCardSection> createState() => _SocialAuthCardSectionState();
}

class _SocialAuthCardSectionState extends State<SocialAuthCardSection> {
  bool buttonIsLoading = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return BlocConsumer<SocialAuthBloc, SocialAuthStates>(
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          context.read<SocialAuthBloc>().add(
            SignInWithGoogleTokenEvent(token: state.token),
          );
          customAwesomeDialog(
            context: context,
            title: 'Sign In With Google Success',
            description:
                'You have successfully signed up to Road Man. Enjoy exploring all the features available to you',
            buttonText: 'Go To Road Man App',
            isSuccess: true,
            onPressed: () {
              GoRouter.of(context).push(Routes.questionnaireViewId);
            },
          );
        } else if (state is SignInWithGoogleFailure) {
          print('error from social card ${state.errorMessage}');
          customAwesomeDialog(
            title: 'Problem Occur',
            description: state.errorMessage,
            context: context,
            isSuccess: false,
            onPressed: () {
              GoRouter.of(context).pop();
            },
          );
        }

        final isLoading = state is SignInWithGoogleLoading;
        setState(() {
          buttonIsLoading = isLoading;
        });
        widget.onSocialAuthLoadingChanged(isLoading);
      },
      builder: (context, state) {
        return CustomTextButton(
          onPressed:
              buttonIsLoading || widget.authButtonIsLoading
                  ? null
                  : () {
                    context.read<SocialAuthBloc>().add(SignInWithGoogleEvent());
                  },
          backgroundColor: kSecondlyLightWhiteColor,
          borderColor: kAppPrimaryBlueColor,
          child:
              state is SignInWithGoogleLoading
                  ? CustomCircleIndicator(color: kAppPrimaryBlueColor)
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: screenWidth * .03,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * .005),
                        child: Icon(
                          FontAwesomeIcons.googlePlusG,
                          color: kAppPrimaryBlueColor,
                          size: screenWidth * .05,
                        ),
                      ),
                      Text(
                        widget.title,
                        style: AfacadTextStyles.textStyle20W700Blue(context),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
