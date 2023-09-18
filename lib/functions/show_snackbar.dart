import 'package:get/get.dart';

void showCustomSnackbar({
  required String title,
  required String message,
  Duration duration = const Duration(seconds: 3),
}) {
  Get.snackbar(
    title,
    message,
    duration: duration,
    borderRadius: 10, // Adjust the border radius
    isDismissible: true, // Snackbar can be dismissed by tapping it
  );
}
