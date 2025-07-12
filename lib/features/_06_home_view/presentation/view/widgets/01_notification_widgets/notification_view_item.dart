import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/features/_06_home_view/data/model/notification_model.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/dialogState.dart';
import '../../../../../../core/utilities/get_time_ago.dart';
import '../../../../../../core/utilities/show_snack_bar.dart';
import '../../../view_model/delete_notification_by_id/delete_notification_by_id_bloc.dart';
import '../../../view_model/delete_notification_by_id/delete_notification_by_id_event.dart';
import '../../../view_model/delete_notification_by_id/delete_notification_by_id_state.dart';
import '../../../view_model/notifications/notifications_cubit.dart';
import 'notification_access_time_section.dart';
import 'notification_message_section.dart';

class NotificationViewItem extends StatelessWidget {
  const NotificationViewItem({super.key, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffD5DCF3),
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.06)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: screenWidth * 0.02,
          children: [
            NotificationViewItemBellSection(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: screenHeight * 0.005,
                children: [
                  NotificationMessageSection(
                    notificationText: notificationModel.text!,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NotificationAccessTimeSection(
                        hour: getTimeAgo(
                          notificationModel.creationDate,
                        ), // ✅ استخدام الدالة
                      ),

                      BlocConsumer<
                        DeleteNotificationByIdBloc,
                        DeleteNotificationByIdStates
                      >(
                        listener: (context, state) {
                          if (state is DeleteNotificationByIdSuccess &&
                              state.id == notificationModel.id) {
                            print(
                              'delete nofification ${notificationModel.id} jjjjjjjjjjjjjjjjjjjjjjjjjj',
                            );
                            context
                                .read<NotificationsCubit>()
                                .fetchAllNotification();
                          } else if (state is DeleteNotificationByIdFailure) {
                            showSafeSnackBar(
                              context,
                              state.errorMessage,
                              kAppPrimaryWrongColor,
                            );
                          }
                        },
                        builder: (context, state) {
                          final isCurrentLoading =
                              state is DeleteNotificationByIdLoading &&
                              state.id == notificationModel.id;

                          return TextButton(
                            onPressed:
                                isCurrentLoading
                                    ? null
                                    : () {
                                      warningAwesomeDialog(
                                        context,
                                        title: 'Delete Notification',
                                        description:
                                            'Are you sure to delete notification!',
                                        buttonAcceptText: 'Delete',
                                        buttonCancelText: 'Cancel',
                                        onPressed: () {
                                          context
                                              .read<
                                                DeleteNotificationByIdBloc
                                              >()
                                              .add(
                                                DeleteNotificationByIdEvent(
                                                  id: notificationModel.id,
                                                ),
                                              );
                                        },
                                      );
                                    },
                            child:
                                isCurrentLoading
                                    ? const CustomCircleIndicator(
                                      color: kAppPrimaryBlackColor,
                                      width: 4,
                                    )
                                    : Icon(
                                      Icons.delete,
                                      size: 24,
                                      color: kAppPrimaryBlackColor,
                                    ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationViewItemBellSection extends StatelessWidget {
  const NotificationViewItemBellSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Icon(
      CupertinoIcons.bell_circle_fill,
      color: kAppPrimaryBlueColor,
      size: screenWidth * 0.078, // بدلًا من 32
    );
  }
}
