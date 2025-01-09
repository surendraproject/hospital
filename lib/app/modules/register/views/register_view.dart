import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/app/routes/app_pages.dart';
import '../../../theme/size_config.dart';
import '../../../theme/theme.dart';
import '../../../widgets/coustom_button.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CustomGradientContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.defaultSize * 2,
            horizontal: SizeConfig.defaultSize * 2,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.defaultSize * 12),
                Align(
                  alignment: Alignment.center,
                  child: Text(           
                    "Join us",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    """New here? Create your account to get started with
          our comprehensive healthcare services.""",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(                
                          color: Colors.grey,
                        ),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize * 3),
                TextFormField(
                  controller: controller.nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: controller.validateName,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize * 0.5,
                      vertical: SizeConfig.defaultSize * 0.5,
                    ),
                    hintText: 'Name*',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: BorderSide(
                        color: BasilTheme.gray.value,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                          color: Color(0xff67729429), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                        color: Color(0xff67729429),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                TextFormField(
                  controller: controller.phonenumbarController,
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: controller.validatePhone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize * 0.5,
                      vertical: SizeConfig.defaultSize * 0.5,
                    ),
                    hintText: 'Enter Your Phone',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: BorderSide(
                        color: BasilTheme.gray.value,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                          color: Color(0xff67729429), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                        color: Color(0xff67729429),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: controller.validateEmail,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize * 0.5,
                      vertical: SizeConfig.defaultSize * 0.5,
                    ),
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: BorderSide(
                        color: BasilTheme.gray.value,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                          color: Color(0xff67729429), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                        color: Color(0xff67729429),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                TextFormField(
                  controller: controller.passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: controller.validatepassword,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.visibility),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize * 0.5,
                      vertical: SizeConfig.defaultSize * 0.5,
                    ),
                    hintText: 'Password*',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: BorderSide(
                        color: BasilTheme.gray.value,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                          color: Color(0xff67729429), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                        color: Color(0xff67729429),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                TextFormField(
                  controller: controller.repasswordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: controller.validatere_password,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.visibility),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize * 0.5,
                      vertical: SizeConfig.defaultSize * 0.5,
                    ),
                    hintText: 'Re-enter Password*',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: BorderSide(
                        color: BasilTheme.gray.value,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                          color: Color(0xff67729429), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 1.2),
                      borderSide: const BorderSide(
                        color: Color(0xff67729429),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => GestureDetector(
                          onTap: () {
                            controller.isAgreed.value =
                                !controller.isAgreed.value;
                          },
                          child: CircleAvatar(
                            radius: SizeConfig.defaultSize,
                            backgroundColor: controller.isAgreed.value
                                ? Colors.green
                                : Colors.grey,
                            child: controller.isAgreed.value
                                ? Icon(Icons.check,
                                    size: SizeConfig.defaultSize,
                                    color: Colors.white)
                                : null,
                          ),
                        )),
                    SizedBox(width: SizeConfig.defaultSize * 0.8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.isAgreed.value =
                              !controller.isAgreed.value;
                        },
                        child: Text(
                          "I agree with the Terms of Service & Privacy Policy",
                          style:
                              TextStyle(fontSize: SizeConfig.defaultSize * 1.2),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.defaultSize * 3),
                CustomButton(
                  text: 'Sign up',
                  onPressed: () {
                    controller.registervalidation();
                  },
                ),
                SizedBox(height: SizeConfig.defaultSize * 3),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: Text(
                      "Have an account? Log in",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: const Color(0xff0EBE7F)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
