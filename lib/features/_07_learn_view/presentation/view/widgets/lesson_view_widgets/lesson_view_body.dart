// ✅ LessonViewBody.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/manager/tokens_manager.dart';
import 'package:road_man_project/core/manager/user_learning_path_manager/user_learning_path_manager.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/lesson_view_widgets/lesson_view_card.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit/learning_path_cubit.dart';

class LessonViewBody extends StatefulWidget {
  const LessonViewBody({super.key, required this.learnLessonModelList});
  final List<LearnPathLessonModel> learnLessonModelList;

  @override
  State<LessonViewBody> createState() => _LessonViewBodyState();
}

class _LessonViewBodyState extends State<LessonViewBody> {
  late String userToken = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getAllCompletedLessonsStatus();
  }

  void _getAllCompletedLessonsStatus() {
    final cubit = context.read<LearningPathCubit>();
    for (final lesson in widget.learnLessonModelList) {
      cubit.getLessonCompleted(userToken: userToken, lessonId: lesson.id);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserToken();
  }

  Future<void> _loadUserToken() async {
    final userTokensModel = await SecureStorageHelper.getUserTokens();
    if (!mounted) return;
    setState(() {
      userToken = userTokensModel?.token ?? '';
    });
  }

  void _onLessonCompleted() {
    setState(() {}); // Rebuild based on updated Hive state
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.learnLessonModelList.length,
        itemBuilder: (context, index) {
          final lesson = widget.learnLessonModelList[index];
          final isCompleted = UserLearningPathHelper.isLessonCompleted(
            lesson.id,
          );
          final isCurrent =
              !isCompleted &&
              (index == 0 ||
                  UserLearningPathHelper.isLessonCompleted(
                    widget.learnLessonModelList[index - 1].id,
                  ));

          return LessonViewCard(
            learnPathLessonModel: lesson,
            userToken: userToken,
            index: index,
            isCompleted: isCompleted,
            isCurrent: isCurrent,
            onLessonCompleted: _onLessonCompleted,
          );
        },
      ),
    );
  }
}
