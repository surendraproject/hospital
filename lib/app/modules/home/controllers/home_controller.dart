import 'package:get/get.dart';

class HomeController extends GetxController {
  final banners = [
    'D:/HospitalProject/hospital/assets/icons/Group (6).svg',
    'D:/HospitalProject/hospital/assets/icons/Group (6).svg',
    'D:/HospitalProject/hospital/assets/icons/Group (6).svg',
  ].obs;  

  final count = 0.obs;

  void increment() => count.value++;
}
