import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class ProfileController extends GetxController {

  final count = 0.obs;
  
   Rxn<File> selectedImage = Rxn();
  void pickImageFromCamera() async {
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

  void increment() => count.value++;
}
