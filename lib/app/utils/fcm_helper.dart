import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import '../data/constants/storage.constants.dart';
import '../data/interfaces/storage.interface.dart';
import 'notification_serivce.dart';

class FCMHelper {
  final IStorage _storage;
  final NotificationService _notificationService;

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FCMHelper(
      {required IStorage storage,
      required NotificationService notificationService})
      : _storage = storage,
        _notificationService = notificationService {
    initializeMessagingService().whenComplete(
      () async {
        Logger().d('FCMMessagingService Initialized');
        await getToken();
      },
    );
  }

  Future<void> getToken() async {
    try {
      final fcmToken = await messaging.getToken();
      Logger().d('FCMToken: $fcmToken');
      await _storage.write(key: StorageConstants.fcmToken, value: fcmToken);
    } catch (e) {
      Logger().d('FCMTokenExceptoin', error: e);
    }

    if (Platform.isIOS) {
      await messaging.requestPermission();
    } else {
      await Permission.notification.request();
    }
  }

  Future<void> initializeMessagingService() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      Logger().d('NotificationTitle: ${event.notification?.title}');
      Logger().d('NotificationContent: ${event.notification?.body}');
      Logger().d('NotificationData: ${event.data}');
      // Generate latest notification
      if (event.notification?.body != null) {
        _notificationService.showNotification(
          id: DateTime.now().millisecond,
          title: event.notification?.title ?? '',
          body: event.notification?.body ?? '',
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Logger().d('Message clicked!');
    });
    FirebaseMessaging.onBackgroundMessage(messageHandler);
  }
}

@pragma("vm:entry-point")
Future<void> messageHandler(RemoteMessage event) async {
  Logger().d('Background NotificationTitle: ${event.notification?.title}');
  Logger().d('Background NotificationContent: ${event.notification?.body}');
  Logger().d('Background NotificationData: ${event.data}');
  // Generate latest notification
  if (event.notification?.body != null) {}
}
