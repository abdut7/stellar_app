import 'package:intl/intl.dart';

String formatTimeDifference(String timestamp) {
  DateTime currentTime = DateTime.now();
  DateTime time = DateTime.parse(timestamp);

  Duration difference = time.difference(currentTime);

  if (difference.inSeconds < 60) {
    return "${difference.inSeconds} seconds ago";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} minutes ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} hours ago";
  } else if (difference.inDays < 365) {
    final dateFormat = DateFormat("MMMM d");
    return dateFormat.format(time);
  } else {
    final dateFormat = DateFormat("yMMMMd");
    return dateFormat.format(time);
  }
}
