class NotificationModel {
  final int id;
  final String? text;
  final DateTime creationDate;
  final bool read;

  NotificationModel({
    required this.id,
    required this.text,
    required this.creationDate,
    required this.read,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      text: json['text'],
      creationDate: DateTime.parse(json['creationDate']),
      read: json['read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'creationDate': creationDate.toIso8601String(),
      'read': read,
    };
  }
}
