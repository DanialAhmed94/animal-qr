import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotification {
  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, {
        RemoteMessage? payload,
        BuildContext? context,
      }) async {
    var androidInitialize =
    const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings initializationSettingsDarwin =
    const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: androidInitialize, iOS: initializationSettingsDarwin);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        print("payload?.data ${payload?.data}");
      },
    );
  }

  static Future<void> showBigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails(
      presentSound: false,
    );

    var not = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(id, title, body, not);
  }
}

// Handler for background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  await LocalNotification.showBigTextNotification(
    title: message.notification!.title.toString(),
    body: message.notification!.body.toString(),
    flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
  );
  debugPrint('Handling a background message: ${message.notification!.title}');
}
