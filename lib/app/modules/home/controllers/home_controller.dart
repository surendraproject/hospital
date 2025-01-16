import 'package:get/get.dart';

class HomeController extends GetxController {
  final banners = [
    'assets/icons/Group 1 (1).png',
    'assets/icons/Group 1 (1).png',
    'assets/icons/Group 1 (1).png',
  ];

  final count = 0.obs;

  void increment() => count.value++;
}
