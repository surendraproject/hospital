import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  final Rxn<File> selectedImage = Rxn();
  final RxString nameError = ''.obs;
  final RxString phoneError = ''.obs;
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString confirmPasswordError = ''.obs;

  final RxString name = ''.obs;
  final RxString phone = ''.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString confirmPassword = ''.obs;

  void updateFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 500,
      maxWidth: 500,
    );
    if (pickedFile?.path != null && pickedFile!.path.isNotEmpty) {
      selectedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  bool validateFields() {
    bool isValid = true;

    if (name.value.trim().isEmpty) {
      nameError.value = 'Name is required';
      isValid = false;
    } else {
      nameError.value = '';
    }

    if (phone.value.trim().isEmpty ||
        !RegExp(r'^\d{10}$').hasMatch(phone.value)) {
      phoneError.value = 'Enter a valid phone number';
      isValid = false;
    } else {
      phoneError.value = '';
    }

    if (email.value.trim().isEmpty ||
        !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(email.value)) {
      emailError.value = 'Enter a valid email address';
      isValid = false;
    } else {
      emailError.value = '';
    }

    if (password.value.trim().isEmpty || password.value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    } else {
      passwordError.value = '';
    }

    if (confirmPassword.value.trim() != password.value) {
      confirmPasswordError.value = 'Passwords do not match';
      isValid = false;
    } else {
      confirmPasswordError.value = '';
    }

    return isValid;
  }
}
