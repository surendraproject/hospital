// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../domain/auth/auth.repostory.dart';
// import '../../../utils/snackbar.util.dart';
// import '../../shared/controllers/loading.controller.dart';

// class RegisterController extends GetxController {

//     final AuthRepository _repository;
//   final _loadingController = Get.find<LoadingController>();

//   RegisterController({required AuthRepository repository})
//       : _repository = repository;
//   final count = 0.obs;

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phonenumbarController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController repasswordController = TextEditingController();
//   //

//   var isPasswordVisible = false.obs;
//   var isRePasswordVisible = false.obs;
//   var isAgreed = false.obs;

//   var nameerror = ''.obs;
//   var phonenumbarerror = ''.obs;
//   var emailerror = ''.obs;
//   var passworderror = ''.obs;
//   var repassworderror = ''.obs;

//  String? validateName(String? value) {
//     if ((value ?? '').isEmpty) {
//       return 'Please enter your name';
//     }
//     return null;
//   }


//   String? validatePhone(String? value) {
//     if (!GetUtils.isNumericOnly(value ?? '') && (value ?? '').length != 10) {
//       return 'Please enter valid phone number';
//     }
//     return null;
//   }



//   String? validateEmail(String? value) {
//     if (!GetUtils.isEmail(value ?? '')) {
//       return 'Please enter valid email';
//     }
//     return null;
//   }

//   String? validatepassword(String? value) {
//     if (!RegExp(r'^\d{8}$').hasMatch(value!)) {
//       return "Enter a valid  password";
//     }
//     return null;
//   }

//   String? validatere_password(String? value) {
//     if (!RegExp(r'^\d{8}$').hasMatch(value!)) {
//       return "Enter a valid  Re_password";
//     }
//     return null;
//   }

//   bool registervalidation() {
//     bool isValid = true;
//     if (nameController.text.isEmpty) {
//       nameerror.value = 'Please enter your name';
//       isValid = false;
//     } else {
//       nameerror.value = '';
//     }

//     if (emailController.text.isEmpty) {
//       emailerror.value = 'Please enter your email';
//       isValid = false;
//     } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
//         .hasMatch(emailController.text)) {
//       emailerror.value = 'Enter a valid email address';
//       isValid = false;
//     } else {
//       emailerror.value = '';
//     }

//     if (passwordController.text.isEmpty) {
//       passworderror.value = 'Please enter your password';
//       isValid = false;
//     } else if (passwordController.text.length < 6) {
//       passworderror.value = 'Password must be at least 6 characters long';
//       isValid = false;
//     } else {
//       passworderror.value = '';
//     }

//     if (repasswordController.text.isEmpty) {
//       repassworderror.value = 'Please confirm your password';
//       isValid = false;
//     } else if (repasswordController.text != passwordController.text) {
//       repassworderror.value = 'Passwords do not match';
//       isValid = false;
//     } else {
//       repassworderror.value = '';
//     }

//     return isValid;
//   }
// Future<void> registerUser() async {
//     String name = nameController.text.trim();
//     String phone = phoneNumberController.text.trim();
//     String email = emailController.text.trim();
//     String dob = dobController.text.trim();
//     String gender = selectedGender.value ?? '';
//     String password = passwordController.text.trim();
//     String confirmPassword = confirmPasswordController.text.trim();
//     String referCode = referCodeController.text.trim();

//     // Validate all fields
//     nameError.value = _validateName(name);
//     dobError.value = _validateDob(dob);
//     genderError.value = _validateGender(gender);
//     phoneNumberError.value = _validatePhoneNumber(phone);
//     emailError.value = _validateEmail(email);
//     passwordError.value = _validatePassword(password);
//     confirmPasswordError.value =
//         _validateConfirmPassword(password, confirmPassword);
//     referCodeError.value = _validateReferCode(referCode);

//     // If all fields are valid, proceed with registration
//     if (nameError.value == null &&
//         dobError.value == null &&
//         genderError.value == null &&
//         phoneNumberError.value == null &&
//         emailError.value == null &&
//         passwordError.value == null &&
//         confirmPasswordError.value == null &&
//         referCodeError.value == null) {
//       try {
//         _loadingController.isLoading = true;
//         Get.focusScope?.unfocus();

//         final response = await _repository.registerUser(
//           name: name,
//           email: email,
//           phone: phone,
//           gender: gender,
//           dob: dob,
//           password: password,
//           confirmPassword: confirmPassword,
//           referCode: referCode,
//         );

//         if (response.status != null && response.status == '1') {
//           // Get.rootDelegate.toNamed(Routes.VERIFY_OTP, arguments: {
//           //   'from': 'register',
//           //   'mobile': phoneNumberController.text
//           // });
//           SnackbarUtil.showSuccess(
//               message: response.message ??
//                   'OTP sent to your registered mobile number.');
//         } else {
//           SnackbarUtil.showError(
//               message: response.message ?? 'Unable to register user.');
//         }
//       } catch (err) {
//         SnackbarUtil.showError(message: err.toString());
//       } finally {
//         _loadingController.isLoading = false;
//       }
//     }
//   }




//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }

//   void toggleRePasswordVisibility() {
//     isRePasswordVisible.value = !isRePasswordVisible.value;
//   }

//   void increment() => count.value++;
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/auth/auth.repostory.dart';
import '../../../utils/snackbar.util.dart';
import '../../shared/controllers/loading.controller.dart';


class RegisterController extends GetxController {
  final AuthRepository _repository;
  final LoadingController _loadingController = Get.find<LoadingController>();

  RegisterController({required AuthRepository repository})
      : _repository = repository;

  // Text Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Observables
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isAgreed = false.obs;

  // Error Observables
  var nameError = ''.obs;
  var phoneError = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  // Validation Methods
  String? _validateName(String value) {
    if (value.trim().isEmpty) return 'Please enter your name';
    return null;
  }

  String? _validatePhone(String value) {
    if (!GetUtils.isNumericOnly(value) || value.length != 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateEmail(String value) {
    if (!GetUtils.isEmail(value)) return 'Please enter a valid email';
    return null;
  }

  String? _validatePassword(String value) {
    if (value.length < 6) return 'Password must be at least 6 characters long';
    return null;
  }

  String? _validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword != password) return 'Passwords do not match';
    return null;
  }

  // Registration Validation
  bool validateAllFields() {
    nameError.value = _validateName(nameController.text) ?? '';
    phoneError.value = _validatePhone(phoneController.text) ?? '';
    emailError.value = _validateEmail(emailController.text) ?? '';
    passwordError.value = _validatePassword(passwordController.text) ?? '';
    confirmPasswordError.value = _validateConfirmPassword(
            passwordController.text, confirmPasswordController.text) ??
        '';

    return nameError.value.isEmpty &&
        phoneError.value.isEmpty &&
        emailError.value.isEmpty &&
        passwordError.value.isEmpty &&
        confirmPasswordError.value.isEmpty;
  }

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Register User
  Future<void> registerUser() async {
    if (!validateAllFields()) return;

    _loadingController.isLoading = true;
    try {
      final response = await _repository.registerUser(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        hospitalid: "2",
      );

      if (response.status == '1') {
        SnackbarUtil.showSuccess(
            message: response.message ?? 'OTP sent to your mobile number.');
        // Navigate to OTP verification screen, if applicable
      } else {
        SnackbarUtil.showError(
            message: response.message ?? 'Unable to register user.');
      }
    } catch (error) {
      SnackbarUtil.showError(message: error.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }
}
