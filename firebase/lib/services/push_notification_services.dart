import 'package:firebase/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// class PushNotification {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   Future<void> handleBackgroundMessage(RemoteMessage message) async {
//     final notification = message.notification;
//     final data = message.data;

//     final title = notification?.title ?? 'No Title';
//     final body = notification?.body ?? 'No Body';

//     print("title: $title");
//     print("body: $body");
//     print("data: $data");
//   }

//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;

//     final navigatorState = navigatorKey.currentState;
//     if (navigatorState != null) {
//       navigatorState.pushNamed("home", arguments: message);
//     } else {
//       print("Navigator state is null");
//     }
//   }

//   Future<void> initPushNotification() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((value) => handleMessage(value));
//   }

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmToken = await _firebaseMessaging.getToken();
//     print("token: $fcmToken");
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       handleBackgroundMessage(message);
//     });
//   }
// }
