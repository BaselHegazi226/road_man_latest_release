import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/manager/tokens_manager.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_state.dart';

import '../../../../../_09_profile_view/presentation/view/widgets/00_profile_common_widgets/profile_user_info.dart';
import '../../../../../_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';
import 'job_view_dashboard_items_section.dart';

class JobViewDashboardViewBody extends StatefulWidget {
  const JobViewDashboardViewBody({super.key});

  @override
  State<JobViewDashboardViewBody> createState() =>
      _JobViewDashboardViewBodyState();
}

class _JobViewDashboardViewBodyState extends State<JobViewDashboardViewBody> {
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userTokens = await SecureStorageHelper.getUserTokens();
    if (userTokens != null && mounted) {
      context.read<GetUserInfoCubit>().getUserInfo(userToken: userTokens.token);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * .04,
        right: screenWidth * .04,
        top: screenHeight * .02,
        bottom: screenHeight * .04,
      ),
      child: Column(
        children: [
          BlocBuilder<GetUserInfoCubit, ProfileStates>(
            builder: (context, state) {
              if (state is GetUserInfoSuccessState) {
                return ProfileUserInfo(
                  name: state.userInfoModel.name ?? '',
                  email: state.userInfoModel.email ?? '',
                  photo: state.userInfoModel.photoBase64 ?? '',
                );
              } else if (state is GetUserInfoLoadingState) {
                return CustomCircleIndicator(color: kAppPrimaryBlueColor);
              } else if (state is GetUserInfoFailureState) {
                return Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                );
              }
              return const SizedBox();
            },
          ),
          Divider(thickness: .5, color: kLogoutLineColor),
          const JobViewDashboardItemsSection(),
          //const Spacer(),
          //Divider(thickness: .5, color: kLogoutLineColor),
          // CustomDashboardIconTitle(
          //   iconData: Icons.logout,
          //   iconColor: Colors.red,
          //   title: 'Log out',
          //   textColor: Colors.red,
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
