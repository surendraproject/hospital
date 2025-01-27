import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital/main.dart';
import 'package:logger/logger.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import '../firebase_options.dart';
import 'data/constants/network.contants.dart';
import 'data/interfaces/storage.interface.dart';
import 'data/storage.dart';
import 'domain/auth/user.model.dart';
import 'modules/shared/controllers/loading.controller.dart';
import 'routes/app_pages.dart';
import 'utils/fcm_helper.dart';
import 'utils/notification_serivce.dart';
import 'utils/permission_helper.dart';
import 'utils/snackbar.util.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      // _initNetworkInfo();
      await _initStorage();
      await _initFirebase();
      await _initFCM();
      await _initGetConnect();
      await _initZegoCloud();
      _initScreenPreference();
      _initGlobalControllers();
      await _checkNotificationPermission();
    } catch (err) {
      Logger().e('Initializer Error: ${err.toString()}');
    }
  }

  // Network info
  // static void _initNetworkInfo() {
  //   Get.put<NetworkInfo>(
  //       NetworkInfoImpl(connectionChecker: InternetConnectionChecker()));
  // }

  // Init Zego ZIM UI Kit
  static Future<void> _initZegoCloud() async {
    {
      ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

      await ZegoUIKit().initLog().then(
        (value) {
          ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
            [ZegoUIKitSignalingPlugin()],
          );
        },
      );
    }
  }

  // Global Get Controllers
  static void _initGlobalControllers() {
    final loading = LoadingController();
    Get.put(loading);
  }

  // Cache Storage
  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put<IStorage>(Storage(getStorage: GetStorage()));
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> _initFCM() async {
    final notificationService = Get.put(NotificationService());
    Get.put<FCMHelper>(FCMHelper(
        notificationService: notificationService,
        storage: Get.find<IStorage>()));
  }

  // Get Connect
  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    connect.allowAutoSignedCert = true;
    final url = NetworkConstants.BASE_URL;
    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 30);
    connect.httpClient.maxAuthRetries = 0;

    connect.httpClient.addRequestModifier<dynamic>(
      (request) {
        Logger().d('REQUEST_URL: ${request.url}');
            Logger().d('TOKEN: ${request.headers['token']}');
        final user = UserModel.fromStorage();
        if (user != null) {
          Logger().d('TOKEN: ${user.token}');
          Logger().d('USER_ID: ${user.id}');
          request.headers['token'] = '${user.token}';
          request.headers['hospital_id'] = '2';    
          request.headers['user_id'] = '${user.id}';
        }
        return request;
      },
    );  

    connect.httpClient.addResponseModifier<dynamic>(
      (request, response) async {
        Logger().d('RESPONSE_CODE: ${response.statusCode}');
        Logger().d('RESPONSE_BODY: ${response.bodyString}');
        if (response.statusCode == 401 || response.statusCode == 403) {
          Get.rootDelegate.history.clear();
          Get.rootDelegate.offAndToNamed(Routes.LOGIN);
          SnackbarUtil.showWarning(
            message: 'Session expired. Please log in again.',
          );
        }
        return response;
      },
    );

    Logger().i('Logged in: $url');
    Get.put(connect);
  }

  static Future<void> _checkNotificationPermission() async {
    await PermissionHelper.requestNotificationPermission();
  }

  // Screen Preference
  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
      ),
    );
  }
}
