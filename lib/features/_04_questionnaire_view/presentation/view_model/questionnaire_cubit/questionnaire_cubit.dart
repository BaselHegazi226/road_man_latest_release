import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/manager/tokens_manager.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/view_model/questionnaire_cubit/questionnaire_state.dart';

import '../../../data/model/answer_model.dart';
import '../../../data/model/question_model.dart';
import '../../../data/model/questionnaire_response_model.dart';
import '../../../data/repos/questionnaire_repo.dart';

class QuestionnaireCubit extends Cubit<QuestionnaireState> {
  final QuestionnaireRepo questionnaireRepo;

  late PageController pageController;
  List<int> navigationStack = [];
  Map<int, List<QuestionModel>> pageQuestionsMap = {};
  List<int> pageOrder = [];
  Map<int, String?> flowSelectedOptions = {};
  Map<int, Map<int, dynamic>> pageSelections = {};
  List<QuestionnaireResponseModel> userResponses = [];
  int currentPage = 0;
  double progress = 0.0;
  bool isLoading = true;

  QuestionnaireCubit({required this.questionnaireRepo})
    : super(QuestionnaireInitial()) {
    pageController = PageController();
    _init();
  }

  Future<void> _init() async {
    await fetchAllQuestions();
  }

  int get totalPages => pageOrder.length;

  List<QuestionModel> get currentPageData =>
      pageQuestionsMap[pageOrder[currentPage]] ?? [];

  List<QuestionModel> getPageData(int index) =>
      pageQuestionsMap[pageOrder[index]] ?? [];

  void updateProgress() {
    final pageQuestions = pageQuestionsMap[pageOrder[currentPage]] ?? [];
    if (pageQuestions.isNotEmpty && pageQuestions.last.lastPage) {
      progress = 1;
    }
    progress = totalPages > 1 ? currentPage / (totalPages - 1) : 0.0;
    emit(ProgressUpdated(progress));
  }

  void setCurrentPage(int index) {
    currentPage = index;
    updateProgress();
    emit(QuestionnairePageChanged(currentPage, totalPages));
  }

  Future<void> fetchAllQuestions() async {
    isLoading = true;
    emit(QuestionsLoading());

    final result = await questionnaireRepo.fetchAllQuestions();

    result.fold(
      (failure) => emit(
        QuestionsError(failure.errorMessage ?? 'Failed to fetch questions'),
      ),
      (questions) {
        _processQuestions(questions);
        isLoading = false;
        emit(QuestionsLoaded(questions));
        emit(QuestionnaireReady());
      },
    );
  }

  void _processQuestions(List<QuestionModel> questions) {
    pageQuestionsMap.clear();
    pageOrder.clear();
    flowSelectedOptions.clear();
    pageSelections.clear();
    userResponses.clear();

    for (final question in questions) {
      pageQuestionsMap.putIfAbsent(question.pageNumber, () => []).add(question);
    }

    pageOrder.addAll(pageQuestionsMap.keys.toList()..sort());
    updateProgress();
  }

  void navigateToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < pageOrder.length) {
      pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setCurrentPage(pageIndex);
    }
  }

  void goToPreviousPage() {
    if (navigationStack.isNotEmpty) {
      final previousPageIndex = navigationStack.removeLast();
      navigateToPage(previousPageIndex);
    } else if (currentPage > 0) {
      navigateToPage(currentPage - 1);
    }
  }

  void goToNextPage() {
    final currentPageNumber = pageOrder[currentPage];
    final pageQuestions = pageQuestionsMap[currentPageNumber] ?? [];

    navigationStack.add(currentPage);

    if (pageQuestions.isNotEmpty &&
        pageQuestions.first.questionForm == 'Flow') {
      _handleFlowNavigation(pageQuestions.first);
    } else {
      _handleRegularNavigation();
    }
  }

  void _handleFlowNavigation(QuestionModel question) {
    final selectedOption = flowSelectedOptions[question.id];
    if (selectedOption != null) {
      final nextPageNumber = _findNextPageNumber(question, selectedOption);
      if (nextPageNumber > 0) {
        final nextPageIndex = pageOrder.indexOf(nextPageNumber);
        if (nextPageIndex >= 0) {
          navigateToPage(nextPageIndex);
          return;
        }
      }
    }
    _proceedToNext();
  }

  void _handleRegularNavigation() {
    final pageQuestions = pageQuestionsMap[pageOrder[currentPage]] ?? [];
    if (pageQuestions.isNotEmpty && pageQuestions.last.lastPage) {
      handleQuestionnaireComplete();
    } else {
      _proceedToNext();
    }
  }

  void _proceedToNext() {
    if (currentPage < totalPages - 1) {
      Timer(const Duration(milliseconds: 300), () {
        navigateToPage(currentPage + 1);
      });
    } else {
      handleQuestionnaireComplete();
    }
  }

  int _findNextPageNumber(QuestionModel question, String selectedOptionText) {
    return question.answers
        .firstWhere(
          (a) => a.text == selectedOptionText,
          orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
        )
        .nextPageNumber;
  }

  void selectFlowOption(int questionId, AnswerModel option) {
    flowSelectedOptions[questionId] = option.text;
    emit(FlowOptionSelected(questionId, option));
    _handleFlowSelectionNavigation(questionId, option);
  }

  void _handleFlowSelectionNavigation(int questionId, AnswerModel option) {
    final question = _findQuestionById(questionId);
    if (question != null) {
      final answer = question.answers.firstWhere(
        (a) => a == option,
        orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
      );

      if (answer.id > 0 && answer.nextPageNumber > 0) {
        final nextPageIndex = pageOrder.indexOf(answer.nextPageNumber);
        if (nextPageIndex >= 0) {
          navigationStack.add(currentPage);
          Timer(const Duration(milliseconds: 300), () {
            navigateToPage(nextPageIndex);
          });
          return;
        }
      }
    }
    _proceedToNext();
  }

  void selectRadioOption(int pageNumber, int questionId, String value) {
    pageSelections.putIfAbsent(pageNumber, () => {})[questionId] = value;
    emit(RadioOptionSelected(questionId, value));
  }

  String? getRadioSelection(int questionId) {
    for (final pageSelection in pageSelections.values) {
      if (pageSelection.containsKey(questionId)) {
        return pageSelection[questionId] as String?;
      }
    }
    return null;
  }

  void selectCheckboxOption(
    int pageNumber,
    int questionId,
    String value,
    bool isSelected,
  ) {
    pageSelections.putIfAbsent(pageNumber, () => {});
    pageSelections[pageNumber]!.putIfAbsent(questionId, () => <String>[]);

    final selectedOptions =
        pageSelections[pageNumber]![questionId] as List<String>;

    if (isSelected && !selectedOptions.contains(value)) {
      selectedOptions.add(value);
    } else if (!isSelected && selectedOptions.contains(value)) {
      selectedOptions.remove(value);
    }

    emit(CheckboxOptionSelected(questionId, value, isSelected));
  }

  List<String> getCheckboxSelections(int questionId) {
    for (final pageSelection in pageSelections.values) {
      if (pageSelection.containsKey(questionId)) {
        return pageSelection[questionId] as List<String>;
      }
    }
    return [];
  }

  bool canProceedFromCurrentPage() {
    final pageNumber = pageOrder[currentPage];
    final questions = pageQuestionsMap[pageNumber] ?? [];

    if (questions.isEmpty) return true;

    if (questions.first.questionForm == 'Flow') {
      return flowSelectedOptions[questions.first.id] != null;
    }

    return _allQuestionsAnswered(pageNumber, questions);
  }

  bool _allQuestionsAnswered(int pageNumber, List<QuestionModel> questions) {
    final pageSelections = this.pageSelections[pageNumber] ?? {};

    for (final question in questions) {
      final selection = pageSelections[question.id];

      if (question.questionForm == 'RadioButton' && selection == null) {
        return false;
      }

      if (question.questionForm == 'CheckBox' &&
          (selection == null || (selection is List && selection.isEmpty))) {
        return false;
      }
    }
    return true;
  }

  void handleQuestionnaireComplete() {
    _submitFlowAnswers();
    _submitRegularAnswers();
    submitQuestionnaire();
  }

  void _submitFlowAnswers() {
    flowSelectedOptions.forEach((questionId, selectedOption) {
      final question = _findQuestionById(questionId);
      if (question != null && selectedOption != null) {
        final answer = question.answers.firstWhere(
          (a) => a.text == selectedOption,
          orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
        );
        if (answer.id > 0) {
          submitAnswer(questionId: questionId, answerId: answer.id);
        }
      }
    });
  }

  void _submitRegularAnswers() {
    pageSelections.forEach((pageNumber, selections) {
      selections.forEach((questionId, selected) {
        final question = _findQuestionById(questionId);
        if (question != null) {
          if (question.questionForm == 'RadioButton' && selected != null) {
            _submitRadioAnswer(question, selected);
          } else if (question.questionForm == 'CheckBox' &&
              selected is List<String>) {
            _submitCheckboxAnswers(question, selected);
          }
        }
      });
    });
  }

  void _submitRadioAnswer(QuestionModel question, dynamic selected) {
    final answer = question.answers.firstWhere(
      (a) => a.text == selected,
      orElse: () => AnswerModel(id: -1, text: '', nextPageNumber: 0),
    );
    if (answer.id > 0) {
      submitAnswer(questionId: question.id, answerId: answer.id);
    }
  }

  void _submitCheckboxAnswers(
    QuestionModel question,
    List<String> selectedOptions,
  ) {
    final selectedAnswerIds =
        selectedOptions
            .map(
              (option) =>
                  question.answers
                      .firstWhere(
                        (a) => a.text == option,
                        orElse:
                            () => AnswerModel(
                              id: -1,
                              text: '',
                              nextPageNumber: 0,
                            ),
                      )
                      .id,
            )
            .where((id) => id > 0)
            .toList();

    if (selectedAnswerIds.isNotEmpty) {
      submitMultipleAnswers(
        questionId: question.id,
        answerIds: selectedAnswerIds,
      );
    }
  }

  QuestionModel? _findQuestionById(int questionId) {
    for (final pageQuestions in pageQuestionsMap.values) {
      for (final question in pageQuestions) {
        if (question.id == questionId) {
          return question;
        }
      }
    }
    return null;
  }

  void submitAnswer({required int questionId, required int answerId}) {
    // Remove existing answer if any
    userResponses.removeWhere((response) => response.questionId == questionId);

    userResponses.add(
      QuestionnaireResponseModel(questionId: questionId, answerIds: [answerId]),
    );

    emit(AnswerSubmissionSuccess(questionId, answerId));
  }

  void submitMultipleAnswers({
    required int questionId,
    required List<int> answerIds,
  }) {
    // Remove existing answer if any
    userResponses.removeWhere((response) => response.questionId == questionId);

    userResponses.add(
      QuestionnaireResponseModel(questionId: questionId, answerIds: answerIds),
    );

    emit(MultipleAnswersSubmissionSuccess(questionId, answerIds));
  }

  Future<void> submitQuestionnaire() async {
    emit(QuestionnaireSubmissionLoading());

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();
      if (userTokens == null) {
        throw Exception('User not authenticated');
      }

      final result = await questionnaireRepo.submitQuestionnaire(
        responses: userResponses,
        token: userTokens.token,
      );

      result.fold(
        (failure) => emit(
          QuestionnaireSubmissionError(
            failure.errorMessage ?? 'Submission failed',
          ),
        ),
        (_) => emit(QuestionnaireSubmissionSuccess()),
      );
    } catch (e) {
      emit(QuestionnaireSubmissionError(e.toString()));
    }
  }

  void resetQuestionnaire() {
    pageController.dispose();
    pageController = PageController();
    navigationStack.clear();
    pageQuestionsMap.clear();
    pageOrder.clear();
    flowSelectedOptions.clear();
    pageSelections.clear();
    userResponses.clear();
    currentPage = 0;
    progress = 0.0;
    isLoading = true;
    emit(QuestionnaireInitial());
    _init();
  }
}
