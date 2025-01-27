import 'package:get/get.dart';

import '../../../data/connect.dart';
import '../../../data/services/home.service.dart';
import '../../../domain/home/home.repository.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
         final connect = Connect(connect: Get.find<GetConnect>());
    final service = HomeService(connect: connect);
    final repository = HomeRepository(service: service);
    Get.lazyPut<PrivacyPolicyController>(
      () => PrivacyPolicyController(repository: repository),
    );
  }
}
