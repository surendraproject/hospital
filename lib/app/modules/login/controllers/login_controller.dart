import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  final TextEditingController MobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController forgetpasswordController =  
      TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController resetpasswordController = TextEditingController();
  final TextEditingController conformpasswordController =
      TextEditingController();

  final RxBool isPhoneValid = false.obs;
  var isPasswordVisible = false.obs;
  var re_setpasswordVisible = false.obs;
  var conformPasswordVisible = false.obs;

  var MobileError = ''.obs;
  var passWordError = ''.obs;
  var bootomseetpasswordError = ''.obs;
  var otpError = ''.obs;
  var resetpasswordError = ''.obs;
  var conformpasswordError = ''.obs;
  @override
  void onInit() {
    super.onInit();
    MobileController.addListener(() {
      isPhoneValid.value = MobileController.text.length == 10;
    });
  }

  bool mobilevalidation() {
    bool isValid = true;
    if (MobileController.text.isEmpty) {
      MobileError.value = 'Please enter Mobile Numbar';
      isValid = false;
    } else {
      MobileError.value = '';
    }
    if (passwordController.text.isEmpty) {
      passWordError.value = 'Please enter password';
      isValid = false;
    } else {
      passWordError.value = '';
    }
    return isValid;
  }

  bool bottomseetpasswordvalidation() {
    bool isValid = true;
    String phoneNumber = forgetpasswordController.text;
    if (phoneNumber.isEmpty) {
      bootomseetpasswordError.value = 'Please enter Phone number';
      isValid = false;
    } else if (phoneNumber.length != 10) {
      bootomseetpasswordError.value = 'Phone number must be 10 digits';
      isValid = false;
    } else if (!RegExp(r'^\d+$').hasMatch(phoneNumber)) {
      bootomseetpasswordError.value = 'Phone number must contain only digits';
      isValid = false;
    } else {
      bootomseetpasswordError.value = '';
    }
    return isValid;
  }


  bool otpvalidation() {
    bool isValid = true;
    if (otpController.text.isEmpty) {
      otpError.value = 'Please enter OTP';
      isValid = false;
    } else if (otpController.text.length != 4) {
      otpError.value = 'OTP must be 4 digits';
      isValid = false;
    } else {
      otpError.value = '';
    }

    return isValid;
  }

  bool re_setpasswordvalidation() {
    bool isValid = true;

    if (resetpasswordController.text.isEmpty) {
      resetpasswordError.value = 'Please enter New password';
      isValid = false;
    } else {
      resetpasswordError.value = '';
    }

    if (conformpasswordController.text.isEmpty) {
      conformpasswordError.value = 'Please enter confirm password';
      isValid = false;
    } else {
      conformpasswordError.value = '';
    }

    if (resetpasswordController.text != conformpasswordController.text) {
      conformpasswordError.value = 'Passwords do not match';
      isValid = false;
    }

    return isValid;
  }

  @override
  void onClose() {
    MobileController.dispose();
    passwordController.dispose();
    forgetpasswordController.dispose();
    otpController.dispose();
    resetpasswordController.dispose();
    conformpasswordController.dispose();
    super.onClose();
  }

  void PasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void re_setpasswordVisibility() {
    re_setpasswordVisible.value = !re_setpasswordVisible.value;
  }

  void ConformpasswordVisibility() {
    conformPasswordVisible.value = !conformPasswordVisible.value;
  }

  void increment() => count.value++;
}
