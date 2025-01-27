import 'package:get/get.dart';

import '../../../domain/home/home.repository.dart';
import '../../../domain/home/models/contect.response.model.dart';
import '../../../utils/snackbar.util.dart';
import '../../shared/controllers/loading.controller.dart';

class ContactUsController extends GetxController {
  final HomeRepository _repository;
  final _loadingController = Get.find<LoadingController>();

  ContactUsController({required HomeRepository repository})
      : _repository = repository;
  final count = 0.obs;

  Rxn<ContactResponse> contactData = Rxn();
  
  Future<void> getContactData() async {
    try {
      _loadingController.isLoading = true;
      final response = await _repository.getContactData();
      if (response != null) {
        contactData.value = response;
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
    getContactData();
  }
  void increment() => count.value++;
}
