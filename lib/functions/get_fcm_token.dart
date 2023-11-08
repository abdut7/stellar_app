import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getFCMToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  try {
    // Request permission to receive notifications if not already granted
    NotificationSettings settings = await messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // Get the FCM token
      String? fcmToken = await messaging.getToken();
      return fcmToken;
    }
  } catch (e) {
    print('Failed to get FCM token: $e');
  }

  return null;
}
