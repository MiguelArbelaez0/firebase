import 'package:firebase/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handleBackgrounMessage(RemoteMessage message) async {
    final title = message.notification?.title ?? 'No Title';
    final body = message.notification?.body ?? 'No Body';
    final data = message.data;
    print("title: $title");
    print("body: $body");
    print("data: $data");
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // Pass the message only if it's not null
    navigatorKey.currentState?.pushNamed("home", arguments: message);
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => handleMessage(value));
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("token: $fcmToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgrounMessage);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleBackgrounMessage(message);
    });
  }
}
