String getTimeAgo(DateTime dateTime) {
  // نجعل التاريخين بدون وقت (بس التاريخ فقط)
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);

  final difference = today.difference(dateOnly);

  final years = difference.inDays ~/ 365;
  final months = (difference.inDays % 365) ~/ 30;
  final days = (difference.inDays % 30);

  if (years > 0) {
    if (months > 0) {
      return '$years ${_pluralize("year", years)} and $months ${_pluralize("month", months)} ago';
    }
    return '$years ${_pluralize("year", years)} ago';
  } else if (months > 0) {
    return '$months ${_pluralize("month", months)} ago';
  } else if (days > 0) {
    return '$days ${_pluralize("day", days)} ago';
  } else {
    return 'Today';
  }
}

String _pluralize(String word, int value) {
  return value == 1 ? word : '${word}s';
}
