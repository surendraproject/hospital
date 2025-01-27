

import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    _initNotifications();
  }

  Future<void> _initNotifications() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('notify_icon');
    DarwinInitializationSettings initializationSettingsIOS =
        const  DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        log('onDidReceiveNotificationResponse: ${notificationResponse.notificationResponseType}');
        log('onDidReceiveNotificationResponse: ${notificationResponse.payload}');
      },
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  NotificationDetails? notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'Push Notification',
        'Push Notification',
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification(
      {required int id,
      required String title,
      required String body,
      String? payload}) async {
    await notificationsPlugin.show(id, title, body, notificationDetails());
  }
}

@pragma("vm:entry-point")
Future<void> onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse) async {
  log('onDidReceiveBackgroundNotificationResponse: ${notificationResponse.notificationResponseType}');
  log('onDidReceiveBackgroundNotificationResponse: ${notificationResponse.payload}');
}
