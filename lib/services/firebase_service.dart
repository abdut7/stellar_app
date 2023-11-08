import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  Logger log = Logger();
  log.d(message.notification?.title);
  log.d(message.notification?.body);
  log.d(message.data);
}

class FirebaseApi {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
