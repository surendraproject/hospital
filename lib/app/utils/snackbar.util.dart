import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/size_config.dart';
import '../theme/theme.dart';

class SnackbarUtil {
  static void showSuccess({required String message}) {
    Get.rawSnackbar(
      title: 'Success',
      icon: Icon(
        Icons.thumb_up,
        color: Get.theme.colorScheme.secondary,
      ),
      message: message,
      backgroundColor: Get.theme.colorScheme.secondary.withOpacity(0.6),
      margin: EdgeInsets.all(SizeConfig.defaultSize),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showWarning({required String message}) {
    Get.rawSnackbar(
      title: 'Alert',
      icon: Icon(
        Icons.warning,
        color: BasilTheme.yellow.value,
      ),
      message: message,
      backgroundColor: BasilTheme.yellow.value.withOpacity(0.5),
      margin: EdgeInsets.all(SizeConfig.defaultSize),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showError({required String message}) {
    Get.rawSnackbar(
      title: 'Error',
      icon: Icon(
        Icons.thumb_down,
        color: Get.theme.colorScheme.error,
      ),
      message: message,
      backgroundColor: Get.theme.colorScheme.error.withOpacity(0.6),
      margin: EdgeInsets.all(SizeConfig.defaultSize),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
