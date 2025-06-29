class AnswerModel {
  final int id;
  final String text;
  final int nextPageNumber;

  AnswerModel({
    required this.id,
    required this.text,
    required this.nextPageNumber,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'],
      text: json['text'],
      nextPageNumber: json['nextPageNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'nextPageNumber': nextPageNumber};
  }
}
