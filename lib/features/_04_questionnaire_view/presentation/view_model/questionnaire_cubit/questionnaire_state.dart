
import '../../../data/model/answer_model.dart';
import '../../../data/model/question_model.dart';

abstract class QuestionnaireState {}

class QuestionnaireInitial extends QuestionnaireState {}

// Main states
class QuestionnaireReady extends QuestionnaireState {}
class QuestionnaireProcessing extends QuestionnaireState {}
class QuestionnaireCompleted extends QuestionnaireState {}

// Navigation states
class QuestionnairePageChanged extends QuestionnaireState {
  final int currentPage;
  final int totalPages;
  QuestionnairePageChanged(this.currentPage, this.totalPages);
}

class ProgressUpdated extends QuestionnaireState {
  final double progress;
  ProgressUpdated(this.progress);
}

// Data loading states
class QuestionsLoading extends QuestionnaireState {}
class QuestionsLoaded extends QuestionnaireState {
  final List<QuestionModel> questions;
  QuestionsLoaded(this.questions);
}
class QuestionsError extends QuestionnaireState {
  final String message;
  QuestionsError(this.message);
}

// Answer selection states
class FlowOptionSelected extends QuestionnaireState {
  final int questionId;
  final AnswerModel option;
  FlowOptionSelected(this.questionId, this.option);
}

class RadioOptionSelected extends QuestionnaireState {
  final int questionId;
  final String value;
  RadioOptionSelected(this.questionId, this.value);
}

class CheckboxOptionSelected extends QuestionnaireState {
  final int questionId;
  final String value;
  final bool isSelected;
  CheckboxOptionSelected(this.questionId, this.value, this.isSelected);
}

// Answer submission states
class AnswerSubmissionSuccess extends QuestionnaireState {
  final int questionId;
  final int answerId;
  AnswerSubmissionSuccess(this.questionId, this.answerId);
}

class MultipleAnswersSubmissionSuccess extends QuestionnaireState {
  final int questionId;
  final List<int> answerIds;
  MultipleAnswersSubmissionSuccess(this.questionId, this.answerIds);
}

class AnswerSubmissionError extends QuestionnaireState {
  final String message;
  AnswerSubmissionError(this.message);
}

// Questionnaire submission states
class QuestionnaireSubmissionLoading extends QuestionnaireState {}
class QuestionnaireSubmissionSuccess extends QuestionnaireState {}
class QuestionnaireSubmissionError extends QuestionnaireState {
  final String message;
  QuestionnaireSubmissionError(this.message);
}

// Navigation validation
class NavigationBlocked extends QuestionnaireState {
  final String message;
  NavigationBlocked(this.message);
}

// Page content states
class PageContentLoading extends QuestionnaireState {}
class PageContentReady extends QuestionnaireState {
  final List<QuestionModel> questions;
  PageContentReady(this.questions);
}