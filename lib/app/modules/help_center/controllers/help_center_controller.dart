// import 'package:get/get.dart';

// class HelpCenterController extends GetxController {
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

//   void updateSelectedTopic(String topic) {
//     selectedTopic.value = topic;
//   }
// }

import 'package:get/get.dart';

class HelpCenterController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

  final List<String> topics = [
    "General Inquiry",
    "Technical Support",
    "Billing Issue",
    "Feedback",
    "Other",
  ];

  final selectedTopic = "".obs;
  final name = "".obs;
  final email = "".obs;

  final nameError = RxnString();
  final emailError = RxnString();
  final topicError = RxnString();

  void updateSelectedTopic(String topic) {
    selectedTopic.value = topic;
  }

  void updateName(String nameValue) {
    name.value = nameValue;
    validateName();
  }

  void updateEmail(String emailValue) {
    email.value = emailValue;
    validateEmail();
  }

  void validateName() {
    if (name.value.isEmpty) {
      nameError.value = "Name cannot be empty";
    } else {
      nameError.value = null;
    }
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
    if (selectedTopic.value.isEmpty) {
      topicError.value = "Please select a topic";
    } else {
      topicError.value = null;
    }
  }

  bool get isFormValid {
    validateName();
    validateEmail();
    validateTopic();
    return nameError.value == null && emailError.value == null && topicError.value == null;
  }
}
