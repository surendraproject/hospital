import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final count = 0.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonenumbarController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  //

  var isPasswordVisible = false.obs;
  var isRePasswordVisible = false.obs;
  var isAgreed = false.obs;

  var nameerror = ''.obs;
  var phonenumbarerror = ''.obs;
  var emailerror = ''.obs;
  var passworderror = ''.obs;
  var repassworderror = ''.obs;

 String? validateName(String? value) {
    if ((value ?? '').isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }


  String? validatePhone(String? value) {
    if (!GetUtils.isNumericOnly(value ?? '') && (value ?? '').length != 10) {
      return 'Please enter valid phone number';
    }
    return null;
  }



  String? validateEmail(String? value) {
    if (!GetUtils.isEmail(value ?? '')) {
      return 'Please enter valid email';
    }
    return null;
  }

  String? validatepassword(String? value) {
    if (!RegExp(r'^\d{8}$').hasMatch(value!)) {
      return "Enter a valid  password";
    }
    return null;
  }

  String? validatere_password(String? value) {
    if (!RegExp(r'^\d{8}$').hasMatch(value!)) {
      return "Enter a valid  Re_password";
    }
    return null;
  }

  bool registervalidation() {
    bool isValid = true;
    if (nameController.text.isEmpty) {
      nameerror.value = 'Please enter your name';
      isValid = false;
    } else {
      nameerror.value = '';
    }

    if (emailController.text.isEmpty) {
      emailerror.value = 'Please enter your email';
      isValid = false;
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
        .hasMatch(emailController.text)) {
      emailerror.value = 'Enter a valid email address';
      isValid = false;
    } else {
      emailerror.value = '';
    }

    if (passwordController.text.isEmpty) {
      passworderror.value = 'Please enter your password';
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passworderror.value = 'Password must be at least 6 characters long';
      isValid = false;
    } else {
      passworderror.value = '';
    }

    if (repasswordController.text.isEmpty) {
      repassworderror.value = 'Please confirm your password';
      isValid = false;
    } else if (repasswordController.text != passwordController.text) {
      repassworderror.value = 'Passwords do not match';
      isValid = false;
    } else {
      repassworderror.value = '';
    }

    return isValid;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRePasswordVisibility() {
    isRePasswordVisible.value = !isRePasswordVisible.value;
  }

  void increment() => count.value++;
}
