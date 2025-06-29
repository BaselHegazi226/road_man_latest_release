import 'answer_model.dart';

class QuestionModel {
  final int id;
  final String text;
  final int sortOrder;
  final int pageNumber;
  final String questionForm;
  final bool lastPage;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.id,
    required this.text,
    required this.sortOrder,
    required this.pageNumber,
    required this.questionForm,
    required this.answers,
    required this.lastPage,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      text: json['text'],
      sortOrder: json['sortOrder'],
      pageNumber: json['pageNumber'],
      questionForm: json['questionForm'],
      lastPage: json['lastPage'],
      answers:
          (json['answers'] as List)
              .map((answer) => AnswerModel.fromJson(answer))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'sortOrder': sortOrder,
      'pageNumber': pageNumber,
      'questionForm': questionForm,
      'lastPage': lastPage,
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }
}
