import 'package:get/get.dart';

import '../../../data/connect.dart';
import '../../../data/services/home.service.dart';
import '../../../domain/home/home.repository.dart';
import '../controllers/about_us_controller.dart';

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    final connect = Connect(connect: Get.find<GetConnect>());
    final service = HomeService(connect: connect);
    final repository = HomeRepository(service: service);
    Get.lazyPut<AboutUsController>(
      () => AboutUsController(repository: repository),
    );
  }
}
