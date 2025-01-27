import 'package:get/get.dart';

import '../../../domain/home/home.repository.dart';
import '../../../domain/home/models/about.response.model.dart';
import '../../../utils/snackbar.util.dart';
import '../../shared/controllers/loading.controller.dart';

class AboutUsController extends GetxController {

    final HomeRepository _repository;
  final _loadingController = Get.find<LoadingController>();

  AboutUsController({required HomeRepository repository})
      : _repository = repository;
  final count = 0.obs;

  
  Rxn<AboutResponseModel> termsData = Rxn();

  Future<void> getAboutData() async {
    try {
      _loadingController.isLoading = true;  
      final response = await _repository.getAboutData();
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
    getAboutData();
  }


  void increment() => count.value++;
}
