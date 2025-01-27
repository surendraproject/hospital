import 'package:get/get.dart';

import '../../../domain/home/home.repository.dart';
import '../../../domain/home/models/privacy.response.model.dart';
import '../../../utils/snackbar.util.dart';
import '../../shared/controllers/loading.controller.dart';

class PrivacyPolicyController extends GetxController {
  final HomeRepository _repository;
  final _loadingController = Get.find<LoadingController>();

  PrivacyPolicyController({required HomeRepository repository})
      : _repository = repository;

  final count = 0.obs;

  Rxn<PrivacyResponseModel> privacyData = Rxn();

  Future<void> getprivacyData() async {
    try {
      _loadingController.isLoading = true;
      final response = await _repository.getPrivacyData();
      if (response != null) {
        privacyData.value = response;
      } else {
        SnackbarUtil.showError(message: 'Data not found!');
      }
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getprivacyData();
  }

  void increment() => count.value++;
}
