class DateFormat {
  static const List<String> _monthsShort = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  static const List<String> _monthsFull = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  /// 🗓 Converts "12-12-2022" → "Dec 12, 2022"
  static String format(String dateStr) {
    final parts = dateStr.split('-');
    if (parts.length != 3) return dateStr; // invalid input fallback

    final day = int.tryParse(parts[0]) ?? 1;
    final month = int.tryParse(parts[1]) ?? 1;
    final year = int.tryParse(parts[2]) ?? 2000;

    final monthName = _monthsShort[(month - 1).clamp(0, 11)];
    return '$monthName $day, $year';
  }

  /// 🗓 Converts "12-12-2022" → "December"
  static String formatMonth(String dateStr) {
    final parts = dateStr.split('-');
    if (parts.length < 2) return dateStr;

    final month = int.tryParse(parts[1]) ?? 1;
    return _monthsFull[(month - 1).clamp(0, 11)];
  }

  /// 🕓 Converts DateTime → "HH:mm" (24-hour)
  static String formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// 📆 Converts "12-12-2022" → "2022-12-12"
  static String formatYMD(String dateStr) {
    final parts = dateStr.split('-');
    if (parts.length != 3) return dateStr;

    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];
    return '$year-$month-$day';
  }
}
