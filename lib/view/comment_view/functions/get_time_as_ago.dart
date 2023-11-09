import 'package:intl/intl.dart';

String formatTimeDifference(String timestamp) {
  DateTime currentTime = DateTime.now();
  DateTime time = DateTime.parse(timestamp);

  Duration difference = currentTime.difference(time);

  if (difference.inSeconds < 0) {
    return "Now";
  }

  if (difference.inSeconds < 60) {
    return "${difference.inSeconds} sec ago";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} min ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} hr ago";
  } else if (difference.inDays < 365) {
    final dateFormat = DateFormat("MMMM d");
    return dateFormat.format(time);
  } else {
    final dateFormat = DateFormat("yMMMMd");
    return dateFormat.format(time);
  }
}
