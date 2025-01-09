import 'package:get/get.dart';

import '../controllers/side_bar_controller.dart';

class SideBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideBarController>(
      () => SideBarController(),
    );
  }
}
