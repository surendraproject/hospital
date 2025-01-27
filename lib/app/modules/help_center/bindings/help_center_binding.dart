import 'package:get/get.dart';

import '../../../data/connect.dart';
import '../../../data/services/home.service.dart';
import '../../../domain/home/home.repository.dart';
import '../controllers/help_center_controller.dart';

class HelpCenterBinding extends Bindings {
  @override
  void dependencies() {
           final connect = Connect(connect: Get.find<GetConnect>());
    final service = HomeService(connect: connect);
    final repository = HomeRepository(service: service);
    Get.lazyPut<HelpCenterController>(
      () => HelpCenterController(repository: repository),
    );
  }
}
