import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/shimmer/home_shimmer/notification_view_item_shimmer.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/delete_all_notifications/delete_all_notifications_bloc.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/delete_all_notifications/delete_all_notifications_state.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/notifications/notifications_cubit.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';
import '../../../view_model/delete_all_notifications/delete_all_notifications_event.dart';
import '../../../view_model/notifications/notification_states.dart';

AppBar notificationViewAppbar(BuildContext context) {
  final double screenWidth = MediaQuery.sizeOf(context).width;
  return AppBar(
    backgroundColor: kAppPrimaryWhiteColor,
    title: Text(
      'Notification',
      style: AfacadTextStyles.textStyle20W500Blue(
        context,
      ).copyWith(color: kAppPrimaryBlackColor),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      icon: Icon(CupertinoIcons.back, color: kEditProfileIconColor),
    ),
    actions: [
      BlocConsumer<DeleteAllNotificationsBloc, DeleteAllNotificationsState>(
        listener: (context, state) {
          if (state is DeleteAllNotificationsSuccess) {
            context
                .read<NotificationsCubit>()
                .clearAllLocally(); // ✅ الأفضل بدل fetchAllNotification
          } else if (state is DeleteAllNotificationsFailure) {
            showSafeSnackBar(
              context,
              state.errorMessage,
              kAppPrimaryWrongColor,
            );
          }
        },
        builder: (context, state) {
          final notificationState = context.watch<NotificationsCubit>().state;

          // ✅ تحقق من الحالة وإذا كانت القائمة فاضية
          final isEmpty =
              notificationState is NotificationSuccess &&
              notificationState.notifications.isEmpty;

          if (isEmpty) {
            return const SizedBox.shrink(); // 👉 لا تظهر شيء
          }

          return Padding(
            padding: EdgeInsets.only(right: screenWidth * .02),
            child: TextButton(
              onPressed:
                  state is DeleteAllNotificationsLoading
                      ? null
                      : () {
                        warningAwesomeDialog(
                          context,
                          title: 'Delete All Notifications',
                          description:
                              'Are you sure to delete all notifications!',
                          buttonAcceptText: 'Delete',
                          buttonCancelText: 'Cancel',
                          onPressed: () {
                            context.read<DeleteAllNotificationsBloc>().add(
                              DeleteAllNotificationsEvent(),
                            );
                          },
                        );
                      },
              child:
                  state is DeleteAllNotificationsLoading
                      ? const NotificationsClearAllShimmerText()
                      : Text(
                        'Clear All',
                        style: AfacadTextStyles.textStyle16W600Blue(context),
                      ),
            ),
          );
        },
      ),
      // Padding(
      //   padding: EdgeInsets.only(right: screenWidth * .02),
      //   child: TextButton(
      //     onPressed: () {},
      //     child: Row(
      //       spacing: screenWidth * .005,
      //       children: [
      //         Icon(Icons.delete_outline, size: 20, color: kAppPrimaryBlueColor),
      //         Text(
      //           'Clear All',
      //           style: AfacadTextStyles.textStyle14W600Blue(context),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // IconButton(
      //   padding: EdgeInsets.only(right: screenWidth * .04),
      //   onPressed: () {},
      //   icon: Icon(
      //     Icons.delete_outline,
      //     size: 28,
      //     color: kEditProfileIconColor,
      //   ),
      // ),
    ],
  );
}
