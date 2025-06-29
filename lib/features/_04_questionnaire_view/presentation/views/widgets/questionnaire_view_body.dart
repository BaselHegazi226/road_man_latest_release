import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/views/widgets/question_list_page.dart';

import '../../../../../core/utilities/base_text_styles.dart';
import '../../view_model/questionnaire_cubit/questionnaire_cubit.dart';
import '../../view_model/questionnaire_cubit/questionnaire_state.dart';
import 'flow_question_widget.dart';
import 'gradient_progress_bar.dart';
import 'navigation_button.dart';

class QuestionnaireViewBody extends StatelessWidget {
  const QuestionnaireViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionnaireCubit, QuestionnaireState>(
      listener: (context, state) {
        if (state is QuestionnairePageChanged) {
          context.read<QuestionnaireCubit>().updateProgress();
        } else if (state is QuestionnaireSubmissionSuccess) {
          _handleSuccess(context);
        } else if (state is QuestionnaireSubmissionError) {
          _handleFailure(context, state);
        }
      },
      builder: (context, state) {
        final cubit = context.read<QuestionnaireCubit>();
        final screenWidth = MediaQuery.of(context).size.width;

        // Show a loader during initial data fetch or final submission.
        // Note: Your cubit emits `QuestionsLoading`, but the view was checking for `PageContentLoading`.
        // I've updated it to `QuestionsLoading` for consistency.
        if (state is QuestionsLoading || state is QuestionnaireSubmissionLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Once the questions are loaded and processed, show the main questionnaire UI.
        // This condition now correctly handles all active states where the UI should be visible.
        if (cubit.pageQuestionsMap.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 16),
                _buildProgressBar(cubit),
                const SizedBox(height: 16),
                _buildQuestionPages(cubit),
                _buildNavigationButtons(cubit),
              ],
            ),
          );
        }

        // Fallback for any other state (e.g., initial, error)
        return const SizedBox.shrink();
      },
    );
  }

  void _handleSuccess(BuildContext context) {
    customAwesomeDialog(
      context: context,
      isSuccess: true,
      title: 'Recommendation have been made successfully',
      description:
      'Your Recommendation have been made successfully, Go To Your Journey.',
      onPressed: () {
        GoRouter.of(context).push(Routes.mainViewId);
      },
    );
  }

  void _handleFailure(
      BuildContext context, QuestionnaireSubmissionError state) {
    customAwesomeDialog(
      context: context,
      isSuccess: false,
      title: 'Recommendation Failure',
      description: state.message,
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      'Lets Start..',
      style: AfacadTextStyles.textStyle24W700Black(context),
    );
  }

  Widget _buildProgressBar(QuestionnaireCubit cubit) {
    return GradientProgressBar(progress: cubit.progress);
  }

  Widget _buildQuestionPages(QuestionnaireCubit cubit) {
    return Expanded(
      child: PageView.builder(
        controller: cubit.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => cubit.setCurrentPage(index),
        itemCount: cubit.totalPages,
        itemBuilder: (context, index) {
          final pageData = cubit.getPageData(index);

          if (pageData.isEmpty) {
            return const Center(child: Text('No questions for this page'));
          }

          return pageData.first.questionForm == 'Flow'
              ? FlowQuestionWidget(pageData: pageData)
              : QuestionListPage(pageData: pageData);
        },
      ),
    );
  }

  //basel

  Widget _buildNavigationButtons(QuestionnaireCubit cubit) {
    final currentPageData = cubit.currentPageData;
    final isLastPage =
        currentPageData.isNotEmpty && currentPageData.last.lastPage;

    return NavigationButtons(
      currentPage: cubit.currentPage,
      totalPages: cubit.totalPages,
      showNext: currentPageData.isEmpty ||
          currentPageData.first.questionForm != 'Flow',
      isFinish: isLastPage,
      onPrevious: cubit.goToPreviousPage,
      onNext: cubit.goToNextPage,
    );
  }
}