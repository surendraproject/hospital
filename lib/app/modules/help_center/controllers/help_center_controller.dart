import 'package:get/get.dart';

class HelpCenterController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

  // List of topics
  final List<String> topics = [
    "General Inquiry",
    "Technical Support",
    "Billing Issue",
    "Feedback",
    "Other",
  ];

  // Observable to track the selected topic
  final selectedTopic = "".obs;

  // Function to update the selected topic
  void updateSelectedTopic(String topic) {
    selectedTopic.value = topic;
  }
}
