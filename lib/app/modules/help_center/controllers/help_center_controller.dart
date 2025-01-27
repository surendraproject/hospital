// import 'package:get/get.dart';

// import '../../../domain/home/home.repository.dart';
// import '../../shared/controllers/loading.controller.dart';

// class HelpCenterController extends GetxController {

//     final HomeRepository _repository;
//   final _loadingController = Get.find<LoadingController>();

//   HelpCenterController({required HomeRepository repository})
//       : _repository = repository;
//   final count = 0.obs;

//   void increment() => count.value++;

//   final List<String> topics = [
//     "General Inquiry",
//     "Technical Support",
//     "Billing Issue",
//     "Feedback",
//     "Other",
//   ];

//   final selectedTopic = "".obs;
//   final name = "".obs;
//   final email = "".obs;

//   final nameError = RxnString();
//   final emailError = RxnString();
//   final topicError = RxnString();

// void updateSelectedTopic(String topic) {
//   selectedTopic.value = topic;
// }

//   void updateName(String nameValue) {
//     name.value = nameValue;
//     validateName();
//   }

// void updateEmail(String emailValue) {
//   email.value = emailValue;
//   validateEmail();
// }

//   void validateName() {
//     if (name.value.isEmpty) {
//       nameError.value = "Name cannot be empty";
//     } else {
//       nameError.value = null;
//     }
//   }

//   void validateEmail() {
//     if (email.value.isEmpty) {
//       emailError.value = "Email cannot be empty";
//     } else if (!GetUtils.isEmail(email.value)) {
//       emailError.value = "Invalid email address";
//     } else {
//       emailError.value = null;
//     }
//   }

//   void validateTopic() {
//     if (selectedTopic.value.isEmpty) {
//       topicError.value = "Please select a topic";
//     } else {
//       topicError.value = null;
//     }
//   }

//   bool get isFormValid {
//     validateName();
//     validateEmail();
//     validateTopic();
//     return nameError.value == null && emailError.value == null && topicError.value == null;
//   }

//   Rxn<ContactResponse> helpData = Rxn();

//   Future<void> getContactData() async {
//     try {
//       _loadingController.isLoading = true;
//       final response = await _repository.getContactData();
//       if (response != null) {
//         contactData.value = response;
//       } else {
//         SnackbarUtil.showError(message: 'Data not found!');
//       }
//     } catch (err) {
//       SnackbarUtil.showError(message: err.toString());
//     } finally {
//       _loadingController.isLoading = false;
//     }
//   }

// }

import 'package:get/get.dart';
import '../../../domain/home/home.repository.dart';
import '../../../domain/home/models/help_center.body.model.dart';
import '../../../utils/snackbar.util.dart';
import '../../shared/controllers/loading.controller.dart';

class HelpCenterController extends GetxController {
  final HomeRepository _repository;
  final _loadingController = Get.find<LoadingController>();

  HelpCenterController({required HomeRepository repository})
      : _repository = repository;

  // Observables
  final name = ''.obs;
  final email = ''.obs;
  final description = ''.obs;
  final selectedTopic = ''.obs;
  final nameError = RxnString();
  final emailError = RxnString();
  final topicError = RxnString();
  final descriptionError = RxnString();

  final topics = [
    "General Inquiry",
    "Technical Support",
    "Billing Issue",
    "Feedback",
    "Other",
  ];

  void updateSelectedTopic(String topic) {
    selectedTopic.value = topic;
  }

  // Validation Functions
  void validateName() {
    nameError.value = name.value.isEmpty ? "Name cannot be empty" : null;
  }

  void updateEmail(String emailValue) {
    email.value = emailValue;
    validateEmail();
  }

  void validateEmail() {
    if (email.value.isEmpty) {
      emailError.value = "Email cannot be empty";
    } else if (!GetUtils.isEmail(email.value)) {
      emailError.value = "Invalid email address";
    } else {
      emailError.value = null;
    }
  }

  void validateTopic() {
    topicError.value =
        selectedTopic.value.isEmpty ? "Please select a topic" : null;
  }

  void validateDescription() {
    descriptionError.value =
        description.value.isEmpty ? "Description cannot be empty" : null;
  }

  bool get isFormValid {
    validateName();
    validateEmail();
    validateTopic();
    validateDescription();
    return nameError.value == null &&
        emailError.value == null &&
        topicError.value == null &&
        descriptionError.value == null;
  }

  Future<void> submitHelpCenterRequest() async {
    if (!isFormValid) {
      return;
    }

    try {
      _loadingController.isLoading = true;

      final body = HelpCenterBody(
        type: "help_request",
        name: name.value,
        email: email.value,
        topic: selectedTopic.value,
        description: description.value,
      );

      final response = await _repository.getHelpCenterData(
        name: name.value, // Pass actual values here
        email: email.value,
        topic: selectedTopic.value,
        description: description.value,
      );

      SnackbarUtil.showSuccess(message: "Request submitted successfully!");
    } catch (e) {
      SnackbarUtil.showError(message: e.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }
}
