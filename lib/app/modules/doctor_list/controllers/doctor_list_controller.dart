import 'package:get/get.dart';

class DoctorListController extends GetxController {
  final count = 0.obs;
  final selectedIndex = (-1).obs;
    void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
  void increment() => count.value++;
}
