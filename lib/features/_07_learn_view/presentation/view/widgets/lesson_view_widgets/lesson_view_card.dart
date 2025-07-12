import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_blocs/Learning_path_bloc.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit/learning_path_cubit.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit/learning_path_states.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../../core/manager/user_learning_path_manager.dart';
import '../../../../data/model/learn_path_lesson_completed_model.dart';
import '../../../../data/model/learn_path_lesson_model.dart';
import '../../../view_model/learning_path_bloc/learning_path_blocs/Learning_path_events.dart';
import 'lesson_view_card_body.dart';

class LessonViewCard extends StatelessWidget {
  const LessonViewCard({
    super.key,
    required this.learnPathLessonModel,
    required this.userToken,
    required this.index,
    required this.isCompleted,
    required this.isCurrent,
    required this.onLessonCompleted,
  });

  final LearnPathLessonModel learnPathLessonModel;
  final String userToken;
  final int index;
  final bool isCompleted;
  final bool isCurrent;
  final VoidCallback onLessonCompleted;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Container(
      width: screenWidth,
      height: screenHeight * .14,
      padding: EdgeInsets.all(screenWidth * .04),
      margin: EdgeInsets.only(bottom: screenHeight * .005),
      decoration: BoxDecoration(
        color: const Color(0xffE6E8EE),
        borderRadius: BorderRadius.circular(screenWidth * .04),
      ),
      child: CustomFlexibleWidget(
        child: BlocConsumer<LearningPathBloc, LearningPathStates>(
          listener: (context, state) async {
            if (state is LessonCompletedPostSuccess &&
                state.lessonId == learnPathLessonModel.id) {
              // ✅ حفظ محلي
              UserLearningPathHelper.saveLessonCompletedLocally(
                LearnPathLessonCompletedModel(
                  isCompleted: true,
                  lessonId: learnPathLessonModel.id,
                ),
              );

              // ✅ عرض SnackBar
              if (!context.mounted) return;
              showSafeSnackBar(
                context,
                'Lesson 0${learnPathLessonModel.lessonNumber} completed successfully.',
                kAppPrimaryBlueColor,
              );

              // ✅ تحديث التقدم
              await context
                  .read<LearningPathCubit>()
                  .completeLessonAndRefreshLearningPath(
                    userToken: userToken,
                    lessonId: learnPathLessonModel.id,
                  );

              // ✅ تحديث الواجهة
              if (!context.mounted) return;
              onLessonCompleted();

              // ✅ فتح الرابط
              await openUrlFun(context);
            } else if (state is LessonCompletedPostFailure) {
              if (!context.mounted) return;
              customAwesomeDialog(
                title: 'Failed',
                description: 'Can\'t open the source. Please try again later.',
                context: context,
                isSuccess: false,
                onPressed: () {},
              );
            }
          },
          builder: (context, state) {
            return LessonViewCardBody(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              learnPathLessonModel: learnPathLessonModel,
              onPressed:
                  isCompleted || isCurrent
                      ? () {
                        context.read<LearningPathBloc>().add(
                          LessonCompletedPostEvent(
                            userToken: userToken,
                            lessonId: learnPathLessonModel.id,
                          ),
                        );
                      }
                      : null,
              isCompleted: isCompleted,
              isCurrent: isCurrent,
            );
          },
        ),
      ),
    );
  }

  Future<void> openUrlFun(BuildContext context) async {
    final rawUrl = learnPathLessonModel.url.trim();

    final fixedUrl = rawUrl.startsWith('http') ? rawUrl : 'https://$rawUrl';

    print('🔗 Trying to launch: $fixedUrl');

    final launched = await launchUrlString(
      fixedUrl,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && context.mounted) {
      showSafeSnackBar(
        context,
        '❌ فشل في فتح الرابط. تأكد من وجود تطبيق يفتح الروابط زي YouTube أو المتصفح.',
        kAppPrimaryWrongColor,
      );
    }
  }
}
