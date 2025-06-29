import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/profile_widgets/profile_item.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';

import '../../../view_model/get_user_info_cubit/get_user_info_cubit.dart';
import '../../../view_model/profile_blocs/profile_event.dart';
import '../00_profile_common_widgets/profile_const_list.dart';
import 'logout_item.dart';

class ProfileItemsSection extends StatefulWidget {
  const ProfileItemsSection({super.key});

  @override
  State<ProfileItemsSection> createState() => _ProfileItemsSectionState();
}

class _ProfileItemsSectionState extends State<ProfileItemsSection> {
  void _showLogoutDialog(BuildContext context) {
    warningAwesomeDialog(
      context,
      title: 'Log Out',
      description: 'Are you sure you want to log out?',
      buttonAcceptText: 'Log out',
      buttonCancelText: 'No, Thanks',
      onPressed: () {
        context.read<ProfileBloc>().add(LogOutEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = ProfileConstList.profileItemModelList;

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ProfileItem(
              profileItemModel: item,
              onTap: () async {
                switch (item.title) {
                  case 'Edit Profile':
                    final result = await GoRouter.of(
                      context,
                    ).push<bool>(item.routeName);
                    if (result == true && context.mounted) {
                      BlocProvider.of<GetUserInfoCubit>(
                        context,
                      ).localGetUserInfo();
                    }
                    break;
                  default:
                    GoRouter.of(context).push(item.routeName);
                    break;
                }
              },
            );
          },
        ),
        //logout item
        BlocConsumer<ProfileBloc, ProfileStates>(
          listener: (context, state) {
            if (state is LogOutSuccess) {
              GoRouter.of(context).go(Routes.signInViewId);
            } else if (state is LogOutFailure) {
              showSafeSnackBar(
                context,
                state.errorMessage,
                kAppPrimaryWrongColor,
              );
            }
          },
          builder: (context, state) {
            return LogoutItem(onTap: () => _showLogoutDialog(context));
          },
        ),
      ],
    );
  }
}
