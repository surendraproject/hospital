import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<Map<Permission, PermissionStatus>>
      requestPermissionsForChat() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Permission.audio,
      Permission.bluetooth,
      Permission.photos,
      Permission.videos,
    ].request();
    return statuses;
  }

  static Future<void> requestNotificationPermission() async {
    await Permission.notification.isDenied.then((value) {
      Logger().d('NotificationPermission: $value');
      if (value) {
        Permission.notification.request();
      }
    });
  }
}