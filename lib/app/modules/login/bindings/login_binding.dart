import 'package:get/get.dart';

import '../../../data/connect.dart';
import '../../../data/services/auth.services.dart';
import '../../../domain/auth/auth.repostory.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
      final connect = Connect(connect: Get.find<GetConnect>());
    final service = AuthService(connect: connect);
    final repository = AuthRepository(service: service);
    Get.lazyPut<LoginController>(
      
      () => LoginController(repository: repository),
    );
  }
}
