import 'package:intl/intl.dart';

/////////
class DateFormatHelper {
  /// 🗓 Converts "MM-dd-yyyy" → "Dec 17, 2022"
  static String format(String dateStr) {
    try {
      final date = DateFormat('MM-dd-yyyy').parse(dateStr);
      return DateFormat('MMM d, yyyy').format(date);
    } catch (_) {
      return dateStr;
    }
  }

  /// 🗓 Converts "MM-dd-yyyy" → "December"
  static String formatMonth(String dateStr) {
    try {
      final date = DateFormat('MM-dd-yyyy').parse(dateStr);
      return DateFormat('MMMM').format(date);
    } catch (_) {
      return dateStr;
    }
  }

  /// 🕓 Converts "MM-dd-yyyy HH:mm:ss" → "08:45 PM"
  static String formatTime(String input) {
    try {
      final date = DateFormat('MM-dd-yyyy HH:mm:ss').parse(input);
      return DateFormat('hh:mm a').format(date);
    } catch (_) {
      return input;
    }
  }
}
