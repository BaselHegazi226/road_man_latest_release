import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/profile_widgets/profile_items_section.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/get_user_info_cubit/get_user_info_state.dart';

import '../../../../../../core/manager/tokens_manager.dart';
import '../../../../../../core/manager/user_info_manager.dart';
import '../../../../../../generated/assets.dart';
import '../../../view_model/profile_blocs/profile_state.dart';
import '../00_profile_common_widgets/profile_user_info.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody>
    with AutomaticKeepAliveClientMixin {
  bool _dataLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeUserInfo());
  }

  Future<void> _initializeUserInfo() async {
    if (_dataLoaded) return;

    final cubit = context.read<GetUserInfoCubit>();
    await cubit.localGetUserInfo();

    final localData = await UserInfoStorageHelper.getUserInfo();
    if (localData == null) {
      final tokenModel = await SecureStorageHelper.getUserTokens();
      if (tokenModel != null) {
        await cubit.getUserInfo(userToken: tokenModel.token);
      } else {
        if (!mounted) return;
        showSafeSnackBar(
          context,
          "Session is expired...",
          kAppPrimaryWrongColor,
        );
      }
    }

    if (mounted) {
      setState(() => _dataLoaded = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // required with AutomaticKeepAliveClientMixin
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .02),
      child: Column(
        children: [
          BlocConsumer<GetUserInfoCubit, ProfileStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GetUserInfoLoadingState ||
                  state is GetUserInfoFailureState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetUserInfoSuccessState ||
                  state is GetUserInfoLocalSuccessState) {
                final user =
                    state is GetUserInfoSuccessState
                        ? state.userInfoModel
                        : (state as GetUserInfoLocalSuccessState).userInfoModel;

                return ProfileUserInfo(
                  email: user.email ?? 'No Email',
                  name: user.name ?? 'No Name',
                  photo: user.photoBase64 ?? Assets.profileProfileUserImage,
                );
              }

              return const ProfileUserInfo(
                email: 'email@gmail.com',
                name: 'name',
                photo: Assets.profileProfileUserImage,
              );
            },
          ),
          const ProfileItemsSection(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
