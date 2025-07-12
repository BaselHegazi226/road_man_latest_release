import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/00_home_view_widgets/progress_section.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/00_home_view_widgets/recommended_jobs_section.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/00_home_view_widgets/welcome_section.dart';

import '../../../../../../core/manager/tokens_manager.dart';
import '../../../../../_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import 'current_path_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final tokenModelFuture = SecureStorageHelper.getUserTokens();

      tokenModelFuture.then((tokenModel) {
        if (tokenModel != null && mounted) {
          context.read<GetUserInfoCubit>().getUserInfo(
            userToken: tokenModel.token,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: screenSize.height * .03,
          children: [
            const WelcomeSection(),
            const CurrentPathCard(),
            const ProgressSection(),
            const RecommendedJobsSection(),
            SizedBox(
              height: screenSize.height * .02,
            ), // Space for bottom header
          ],
        ),
      ),
    );
  }
}
