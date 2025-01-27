import 'package:get/get.dart';

import '../../../data/connect.dart';
import '../../../data/services/auth.services.dart';
import '../../../domain/auth/auth.repostory.dart';
import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
          final connect = Connect(connect: Get.find<GetConnect>());
    final service = AuthService(connect: connect);
    final repository = AuthRepository(service: service);
    Get.lazyPut<RegisterController>(
      () => RegisterController(repository:repository),
    );
  }
}
