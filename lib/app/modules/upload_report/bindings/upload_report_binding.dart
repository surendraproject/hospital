import 'package:get/get.dart';

import '../controllers/upload_report_controller.dart';

class UploadReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadReportController>(
      () => UploadReportController(),
    );
  }
}
