class Date {
  static DateTime? parseDate(dynamic date) {
    try {
      if (date == null || date.toString().trim().isEmpty) return null;
      return DateTime.parse(date.toString());
    } catch (_) {
      return null;
    }
  }
}
