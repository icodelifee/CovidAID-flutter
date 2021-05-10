// @dart=2.9

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lifecoronasafe/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelKey: 'resource_channel',
            channelName: 'Resource availability notifications',
            channelDescription:
                'Notification channel for resource availability',
            importance: NotificationImportance.Max,
            ledColor: Colors.white)
      ]);
  await Firebase.initializeApp();
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
      criticalAlert: true);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.data != null) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 100,
        channelKey: 'resource_channel',
        title: message.notification.title,
        body: message.notification.body,
      ));
    }
  });
  runApp(App());
}
