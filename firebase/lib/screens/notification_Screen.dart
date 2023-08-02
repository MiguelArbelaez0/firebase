import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments;
    if (message is RemoteMessage) {
      // If args is a RemoteMessage object, use it here

      return Column(
        children: [
          Text("${message.notification?.title}"),
          Text("${message.notification?.body}"),
          Text("${message.data}"),
        ],
      );
    } else {
      return const Center(
        child: Text('Invalid argument type'),
      );
    }
  }
}
