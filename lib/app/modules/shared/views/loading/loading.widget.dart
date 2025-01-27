import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/loading.controller.dart';

class LoadingWidget extends GetWidget<LoadingController> {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.isLoading
            ? PopScope(
                canPop: false,
                child: Stack(
                  children: <Widget>[
                    ModalBarrier(
                      dismissible: false,
                      color: Colors.grey.withOpacity(.3),
                    ),
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            Get.theme.colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}
