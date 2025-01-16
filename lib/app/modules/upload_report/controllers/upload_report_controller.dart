// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class UploadReportController extends GetxController {

//   final count = 0.obs;


//    Rxn<File> selectedImage = Rxn();
//   void pickImageFromCamera() async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 50,
//       maxHeight: 500,
//       maxWidth: 500,
//     );
//     if (pickedFile?.path != null && pickedFile!.path.isNotEmpty) {
//       selectedImage.value = File(pickedFile.path);
//     } else {
//       Get.snackbar('Error', 'No image selected');
//     }
//   }

//   void increment() => count.value++;
// }
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadReportController extends GetxController {
  final selectedImages = <File>[].obs;
    void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  void pickMultipleImages() async {
    if (selectedImages.length >= 3) {
      Get.snackbar('Limit Reached', 'You can only select up to 3 images.');
      return;
    }

    // ignore: unnecessary_nullable_for_final_variable_declarations
    final List<XFile>? pickedFiles = await ImagePicker().pickMultiImage(
      imageQuality: 50,
      maxHeight: 500,
      maxWidth: 500,
    );

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      int remainingSlots = 3 - selectedImages.length;

      selectedImages.addAll(
        pickedFiles
            .take(remainingSlots) // Limit to remaining slots
            .map((file) => File(file.path)),
      );

      if (pickedFiles.length > remainingSlots) {
        Get.snackbar(
          'Limit Reached',
          'Only $remainingSlots more images were added.',
        );
      }
    } else {
      Get.snackbar('Error', 'No images selected.');
    }

    
  }
}