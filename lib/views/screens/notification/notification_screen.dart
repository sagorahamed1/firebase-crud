
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key, required this.notification});



  final String notification;
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      body: Column(
        children: [
          Text("${message.notification!.title.toString()}"),
          Text("${notification.characters}"),
          Text("${notification}"),
        ],
      ),
    );
  }
}
