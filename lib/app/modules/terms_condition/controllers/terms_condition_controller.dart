import 'package:get/get.dart';

import '../../../domain/home/home.repository.dart';
import '../../../domain/home/models/terme.response.dart';
import '../../../utils/snackbar.util.dart';
import '../../shared/controllers/loading.controller.dart';

class TermsConditionController extends GetxController {
  final HomeRepository _repository;
  final _loadingController = Get.find<LoadingController>();

  TermsConditionController({required HomeRepository repository})
      : _repository = repository;
  final count = 0.obs;
  
  Rxn<TermesCondistionResponseModel> termsData = Rxn();

  Future<void> gettermscondistionData() async {
    try {
      _loadingController.isLoading = true;  
      final response = await _repository.gettermesData();
      if (response != null) {
        termsData.value = response;
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
    gettermscondistionData();
  }

  void increment() => count.value++;
}
