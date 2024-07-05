import 'package:intl/intl.dart';

class DateFormatterUtils {
  static String formatCreatedAt(dynamic createdAt) {
    if (createdAt is DateTime) {
      return DateFormat('dd MMM, yyyy').format(createdAt);
    } else if (createdAt is String) {
      try {
        DateTime parsedDateTime = DateTime.parse(createdAt);
        return DateFormat('dd MMM, yyyy').format(parsedDateTime);
      } catch (e) {
        return createdAt;
      }
    } else {
      return '-';
    }
  }

  static String dateTimeFormatCreatedAt(dynamic createdAt) {
    if (createdAt is DateTime) {
      DateTime localDateTime = createdAt.toLocal();
      return DateFormat('dd MMM, yyyy h:mm a').format(localDateTime);
    } else if (createdAt is String) {
      try {
        DateTime parsedDateTime = DateTime.parse(createdAt);
        DateTime localDateTime = parsedDateTime.toLocal();
        return DateFormat('dd MMM, yyyy h:mm a').format(localDateTime);
      } catch (e) {
        return createdAt;
      }
    } else {
      return '-';
    }
  }

  static String formatDateTimeToLocal(dynamic dateTime) {
    if (dateTime is DateTime) {
      DateTime localDateTime = dateTime.toLocal();
      return DateFormat('dd MMM, yyyy').format(localDateTime);
    } else {
      return '';
    }
  }

  static String formatDateYearAt(dynamic createdAt) {
    if (createdAt is DateTime) {
      return DateFormat('dd MMM, yyyy').format(createdAt);
    } else if (createdAt is String) {
      try {
        DateTime parsedDateTime = DateTime.parse(createdAt);
        return DateFormat('dd MMM, yyyy').format(parsedDateTime);
      } catch (e) {
        return createdAt;
      }
    } else {
      return 'Invalid Date';
    }
  }
}
