

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AppointmentController extends GetxController {
//   final selectedDate = DateTime.now().obs;
//   final selectedTime = TimeOfDay.now().obs;
//   final selectedAppointmentType = ''.obs;

//   void updateDate(DateTime date) {
//     selectedDate.value = date;
//   }

//   void updateTime(TimeOfDay time) {
//     selectedTime.value = time;
//   }

//   void updateAppointmentType(String type) {
//     selectedAppointmentType.value = type;
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;
  final selectedAppointmentType = ''.obs;
  final selectedIndex = (-1).obs; // -1 means no item selected initially.

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateTime(TimeOfDay time) {
    selectedTime.value = time;
  }

  void updateAppointmentType(String type) {
    selectedAppointmentType.value = type;
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
