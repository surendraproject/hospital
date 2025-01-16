import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../theme/size_config.dart';
import '../../../theme/theme.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateProfileController());
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(txt: "Update Profile"),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize * 2,
                vertical: SizeConfig.defaultSize * 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 9),
                  GestureDetector(
                    onTap: controller.updateFromCamera,
                    child: Obx(() => controller.selectedImage.value != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                FileImage(controller.selectedImage.value!),
                          )
                        : TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/icons/File.svg',
                                  height: SizeConfig.defaultSize,
                                  width: SizeConfig.defaultSize,
                                ),
                              ),
                              hintText: "Update your profile picture",
                              hintStyle: const TextStyle(color: Colors.grey),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                                borderSide: const BorderSide(
                                  color: Color(0x67729429),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                                borderSide: const BorderSide(
                                  color: Color(0xFF677294),
                                ),
                              ),
                            ),
                          )),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  customTextField(
                    controller: controller,
                    hintText: 'Name',
                    prefixIcon: 'assets/icons/user.svg',
                    errorText: controller.nameError,
                    onChanged: (value) => controller.name.value = value,
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  customTextField(
                    controller: controller,
                    hintText: 'Phone',
                    prefixIcon: 'assets/icons/Email.svg',
                    errorText: controller.phoneError,
                    onChanged: (value) => controller.phone.value = value,
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  customTextField(
                    controller: controller,
                    hintText: 'Email',
                    prefixIcon: 'assets/icons/sms.svg',
                    errorText: controller.emailError,
                    onChanged: (value) => controller.email.value = value,
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  customTextField(
                    controller: controller,
                    hintText: 'Enter your password',
                    prefixIcon: 'assets/icons/Password.svg',
                    errorText: controller.passwordError,
                    onChanged: (value) => controller.password.value = value,
                    isPassword: true,
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  customTextField(
                    controller: controller,
                    hintText: 'Re-enter your password',
                    prefixIcon: 'assets/icons/Password.svg',
                    errorText: controller.confirmPasswordError,
                    onChanged: (value) =>
                        controller.confirmPassword.value = value,
                    isPassword: true,
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  GestureDetector(
                    onTap: () {
                      if (controller.validateFields()) {
                        Get.snackbar('Success', 'Profile updated successfully');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize,
                        vertical: SizeConfig.defaultSize,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.defaultSize),
                        color: const Color(0xff0EBE7F),
                        boxShadow: const [
                          BoxShadow(blurRadius: 1, color: Colors.grey)
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Update",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: BasilTheme.whait.value,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.defaultSize * 2,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextField({
    required UpdateProfileController controller,
    required String hintText,
    required String prefixIcon,
    required RxString errorText,
    required Function(String) onChanged,
    bool isPassword = false,
  }) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: isPassword,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(prefixIcon,
                      height: SizeConfig.defaultSize,
                      width: SizeConfig.defaultSize),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.defaultSize),
                  borderSide: const BorderSide(
                    color: Color(0x67729429),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.defaultSize),
                  borderSide: const BorderSide(
                    color: Color(0xFF677294),
                  ),
                ),
              ),
            ),
            if (errorText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  errorText.value,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ));
  }
}
