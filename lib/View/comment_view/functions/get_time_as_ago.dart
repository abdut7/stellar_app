import 'package:intl/intl.dart';

String formatTimeDifference(String timestamp) {
  DateTime currentTime = DateTime.now();
  DateTime parsedTime = DateTime.parse(timestamp);
  Duration difference = currentTime.difference(parsedTime);

  if (difference.inSeconds < 0) {
    return 'now';
  }

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} seconds ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 365) {
    final months = difference.inDays ~/ 30;
    return '${months} ${months == 1 ? "month" : "months"} ago';
  } else {
    final years = difference.inDays ~/ 365;
    return '${years} ${years == 1 ? "year" : "years"} ago';
  }
}
