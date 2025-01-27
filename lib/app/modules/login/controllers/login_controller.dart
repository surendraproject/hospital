import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/auth/auth.repostory.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/size_config.dart';
import '../../../utils/snackbar.util.dart';
import '../../../widgets/coustom_button.dart';
import '../../../widgets/coustom_filds.dart';
import '../../shared/controllers/loading.controller.dart';

class LoginController extends GetxController {
  final AuthRepository _repository;
  final _loadingController = Get.find<LoadingController>();

  LoginController({required AuthRepository repository})
      : _repository = repository;

  // Controllers and Observables
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final TextEditingController forgetpasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController resetpasswordController = TextEditingController();
  final TextEditingController conformpasswordController =
      TextEditingController();

  final isPhoneValid = false.obs;
  final isPasswordVisible = false.obs;
  final mobileError = ''.obs;
  final passwordError = ''.obs;
  var otpError = ''.obs;
  var bootomseetpasswordError = ''.obs;
  var conformpasswordError = ''.obs;
  var resetpasswordError = ''.obs;
  var re_setpasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Update phone validation dynamically
    mobileController.addListener(() {
      isPhoneValid.value = _validatePhone(mobileController.text) == null;
    });
  }

  // Validation Functions
  String? _validatePhone(String phone) {
    if (phone.isEmpty) return 'Phone number is required';
    if (phone.length != 10 || !RegExp(r'^\d+$').hasMatch(phone)) {
      return 'Invalid phone number';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  bool re_setpasswordvalidation() {
    bool isValid = true;

    // New password validation
    if (resetpasswordController.text.isEmpty) {
      resetpasswordError.value = 'Please enter a new password';
      isValid = false;
    } else if (resetpasswordController.text.length < 6) {
      resetpasswordError.value = 'Password must be at least 6 characters';
      isValid = false;
    } else {
      resetpasswordError.value = '';
    }

    // Confirm password validation
    if (conformpasswordController.text.isEmpty) {
      conformpasswordError.value = 'Please confirm your password';
      isValid = false;
    } else if (resetpasswordController.text != conformpasswordController.text) {
      conformpasswordError.value = 'Passwords do not match';
      isValid = false;
    } else {
      conformpasswordError.value = '';
    }

    return isValid;
  }

  // Login Functionality
  Future<void> loginUser() async {
    mobileError.value = _validatePhone(mobileController.text) ?? '';
    passwordError.value = _validatePassword(passwordController.text) ?? '';

    if (mobileError.value.isNotEmpty || passwordError.value.isNotEmpty) return;
    _loadingController.isLoading = true;
    try {
      _loadingController.isLoading = true;
      Get.focusScope?.unfocus();

      final response = await _repository.loginUser(
        type: 'login',
        mobile: mobileController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.status == '1') {
        SnackbarUtil.showSuccess(
            message: response.message ?? 'Login successful!');
        Get.offNamed(Routes.HOME);
      } else {
        SnackbarUtil.showError(message: response.message ?? 'Login failed');
      }
    } catch (e) {
      SnackbarUtil.showError(message: e.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  // Forget Password Functionality
  Future<void> forgetPassword(String phone,BuildContext context) async {
      final phoneError = _validatePhone(phone);
      if (phoneError != null) {
        SnackbarUtil.showError(message: phoneError);
        return;
      }

    try {
      _loadingController.isLoading = true;
      Get.focusScope?.unfocus();

      final response = await _repository.forgetPassword(mobile: phone);

      if (response.status == '1') {
        SnackbarUtil.showSuccess(
            message: response.message ?? 'OTP sent successfully');
        
            // ignore: use_build_context_synchronously
            _showOTPBottomSheet(context);
                Get.back();
       
      } else {
        SnackbarUtil.showError(
            message: response.message ?? 'Unable to verify user.');
      }
    } catch (e) {
      SnackbarUtil.showError(message: e.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void PasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
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



  void re_setpasswordVisibility() {
    re_setpasswordVisible.value = !re_setpasswordVisible.value;
  }



      
  void _showOTPBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.defaultSize * 2),
          topRight: Radius.circular(SizeConfig.defaultSize * 2),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.defaultSize * 2,
            right: SizeConfig.defaultSize * 2,
            top: SizeConfig.defaultSize * 2,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter 4-Digit Code",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: SizeConfig.defaultSize),
              Text(
                "Enter the 4 digits code that you received on your phone number.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.defaultSize * 3),
              Obx(
                () => CustomTextField(
                  maxLength: 4,
                  counterText: '',
                  hintText: "Enter 4-Digit Code",
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  errorText: otpError.value,
                ),
              ),
              SizedBox(height: SizeConfig.defaultSize * 2),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  // if (controller.otpvalidation()) {
                  //   Navigator.pop(context);
                  //   _showsetBottomSheet(context);
                  // }
                },
              ),
              SizedBox(height: SizeConfig.defaultSize * 2),
            ],
          ),
        );
      },
    );
  }}
