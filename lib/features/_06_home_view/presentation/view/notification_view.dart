import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/app_get.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/01_notification_widgets/notification_view_body.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/01_notification_widgets/notifications_view_app_bar.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/delete_all_notifications/delete_all_notifications_bloc.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/delete_notification_by_id/delete_notification_by_id_bloc.dart';

import '../../../../core/helper/const_variables.dart';
import '../../data/repos/home_repo_implement.dart';
import '../view_model/notifications/notifications_cubit.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: AppGet.getIt<NotificationsCubit>()..fetchAllNotification(),
        ),
        BlocProvider(
          create:
              (context) => DeleteAllNotificationsBloc(
                homeRepoImplement: HomeRepoImplement(),
              ),
        ),
        BlocProvider(
          create:
              (context) => DeleteNotificationByIdBloc(
                homeRepoImplement: HomeRepoImplement(),
              ),
        ),
      ],
      child: Scaffold(
        backgroundColor: kAppPrimaryWhiteColor,
        appBar: notificationViewAppbar(context),
        body: const NotificationViewBody(),
      ),
    );
  }
}
