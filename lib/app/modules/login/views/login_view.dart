// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../routes/app_pages.dart';
// import '../../../theme/size_config.dart';
// import '../../../widgets/coustom_button.dart';
// import '../../../widgets/coustom_continer.dart';
// import '../../../widgets/coustom_filds.dart';
// import '../controllers/login_controller.dart';

// class LoginView extends GetView<LoginController> {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body: CustomGradientContainer(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             vertical: SizeConfig.defaultSize * 2,
//             horizontal: SizeConfig.defaultSize * 2,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: SizeConfig.defaultSize * 12),
//                 Text(
//                   "Welcome back",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyLarge
//                       ?.copyWith(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: SizeConfig.defaultSize),
//                 Text(
//                   """Welcome back! Log in to access your personalized
// healthcare portal, view your medical records""",
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                         color: Colors.grey,
//                         fontSize: 13,
//                       ),
//                 ),
//                 SizedBox(height: SizeConfig.defaultSize * 5),
//                 Obx(
//                   () => CustomTextField(
//                     maxLength: 10,
//                     counterText: '',
//                     keyboardType: TextInputType.number,
//                     hintText: "Enter Phone Number*",
//                     controller: controller.mobileController,
//                     errorText: controller.mobileError.value,
//                     suffixIcon: controller.isPhoneValid.value
//                         ? const Icon(Icons.check_circle, color: Colors.green)
//                         : null,
//                   ),
//                 ),
//                 SizedBox(height: SizeConfig.defaultSize * 2),
//                 Obx(
//                   () => CustomTextField(
//                     hintText: "Enter Password*",
//                     obscureText: !controller.isPasswordVisible.value,
//                     controller: controller.passwordController,
//                     errorText: controller.passwordError.value,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         controller.isPasswordVisible.value
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Colors.grey,
//                       ),
//                       onPressed: controller.PasswordVisibility,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: SizeConfig.defaultSize * 3),
//                 CustomButton(
//                   text: 'Login',
//                   onPressed: controller.loginUser,
//                 ),
//                 SizedBox(height: SizeConfig.defaultSize * 3),
//                 GestureDetector(
//                   // onTap: () => ForgotPasswordBottomSheet(),
//                   onTap: () => _showForgotPasswordBottomSheet(context),
//                   child: Text(
//                     "Forget password",
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           color: const Color(0xff0EBE7F),
//                         ),
//                   ),
//                 ),
//                 SizedBox(height: SizeConfig.defaultSize * 7),
//                 GestureDetector(
//                   onTap: () {
//                     Get.toNamed(Routes.REGISTER); // Navigate to Register Page
//                   },
//                   child: Text(
//                     "Don't have an account? Sign up",
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           color: const Color(0xff0EBE7F),
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showForgotPasswordBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       builder: (BuildContext context) {
//         final phoneController = TextEditingController();
//         return Padding(
//           padding: EdgeInsets.only(
//             left: SizeConfig.defaultSize * 2,
//             right: SizeConfig.defaultSize * 2,
//             top: SizeConfig.defaultSize * 2,
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 "Forget Password",
//                 style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//               SizedBox(height: SizeConfig.defaultSize),
//               Text(
//                 "Enter your phone number for the verification proccesss, we will send 4 digits code to your phone number.",
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Colors.grey,
//                       fontSize: 13,
//                     ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: SizeConfig.defaultSize * 3),
//               Obx(
//                 () => CustomTextField(
//                   keyboardType: TextInputType.number,
//                   maxLength: 10,
//                   counterText: '',
//                   hintText: "Phone Number",
//                   controller: phoneController,
//                   // errorText: controller.bootomseetpasswordError.value,
//                   errorText: controller.otpError.value,
//                 ),
//               ),
//               SizedBox(height: SizeConfig.defaultSize * 2),
//               CustomButton(
//                 text: 'Continue',
//                 onPressed: () {
//                   if (controller.bottomseetpasswordvalidation()) {
//                     // final controller = Get.find<LoginController>();
//                     controller.forgetPassword(phoneController.text.trim());
//                     // _showOTPBottomSheet(context);
//                   }
//                 },
//               ),
//               SizedBox(height: SizeConfig.defaultSize * 2),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showOTPBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(SizeConfig.defaultSize * 2),
//           topRight: Radius.circular(SizeConfig.defaultSize * 2),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             left: SizeConfig.defaultSize * 2,
//             right: SizeConfig.defaultSize * 2,
//             top: SizeConfig.defaultSize * 2,
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 "Enter 4-Digit Code",
//                 style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//               SizedBox(height: SizeConfig.defaultSize),
//               Text(
//                 "Enter the 4 digits code that you received on your phone number.",
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Colors.grey,
//                       fontSize: 13,
//                     ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: SizeConfig.defaultSize * 3),
//               Obx(
//                 () => CustomTextField(
//                   maxLength: 4,
//                   counterText: '',
//                   hintText: "Enter 4-Digit Code",
//                   controller: controller.otpController,
//                   keyboardType: TextInputType.number,
//                   errorText: controller.otpError.value,
//                 ),
//               ),
//               SizedBox(height: SizeConfig.defaultSize * 2),
//               CustomButton(
//                 text: 'Continue',
//                 onPressed: () {
//                   // if (controller.otpvalidation()) {
//                   //   Navigator.pop(context);
//                   //   _showsetBottomSheet(context);
//                   // }
//                 },
//               ),
//               SizedBox(height: SizeConfig.defaultSize * 2),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class ForgotPasswordBottomSheet extends StatelessWidget {
//   final controller = Get.find<LoginController>();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           "Forget Password",
//           style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//         ),
//         SizedBox(height: SizeConfig.defaultSize),
//         Text(
//           "Enter your phone number. We will send a 4-digit code to reset your password.",
//           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                 color: Colors.grey,
//                 fontSize: 13,
//               ),
//           textAlign: TextAlign.center,
//         ),
//         SizedBox(height: SizeConfig.defaultSize * 3),
//         Obx(
//           () => CustomTextField(
//             keyboardType: TextInputType.number,
//             maxLength: 10,
//             counterText: '',
//             hintText: "Phone Number",
//             controller: controller.mobileController,
//             errorText: controller.mobileError.value,
//           ),
//         ),
//         SizedBox(height: SizeConfig.defaultSize * 2),
//         CustomButton(
//           text: 'Continue',
//           onPressed: () {
//             if (controller.bottomseetpasswordvalidation()) {
//               // final controller = Get.find<LoginController>();
//               controller
//                   .forgetPassword(controller.mobileController.text.trim());
//               // _showOTPBottomSheet(context);
//             }
//             // Handle "Continue" logic
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/size_config.dart';
import '../../../widgets/coustom_button.dart';
import '../../../widgets/coustom_continer.dart';
import '../../../widgets/coustom_filds.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
              children: [
                SizedBox(height: SizeConfig.defaultSize * 12),
                Text(
                  "Welcome back",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                Text(
                  """Welcome back! Log in to access your personalized
     healthcare portal, view your medical records""",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                ),
                SizedBox(height: SizeConfig.defaultSize * 5),
                Obx(
                  () => CustomTextField(
                    maxLength: 10,
                    counterText: '',
                    keyboardType: TextInputType.number,
                    hintText: "Enter Phone Number*",
                    controller: controller.mobileController,
                    suffixIcon: Obx(() {
                      return controller.isPhoneValid.value
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const SizedBox.shrink();
                    }),
                    errorText: controller.mobileError.value,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize * 2),
                Obx(() => CustomTextField(
                    hintText: "Enter Password*",
                    controller: controller.passwordController,
                    obscureText: !controller.isPasswordVisible.value,
                    errorText: controller.passwordError.value,
                    suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: controller.PasswordVisibility))),
                SizedBox(height: SizeConfig.defaultSize * 3),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    controller.loginUser();
                    // controller.mobilevalidation();
                    // if (controller.mobilevalidation()) {
                    //   Get.toNamed(Routes.HOME);
                    // }
                  },
                ),
                SizedBox(height: SizeConfig.defaultSize * 3),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () => _showForgotPasswordBottomSheet(context),
                    child: Text(
                      "Forget password",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xff0EBE7F),
                          ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize * 7),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text(
                      "Have an account? Log in",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xff0EBE7F),
                          ),
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

  void _showForgotPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Forget Password",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: SizeConfig.defaultSize),
              Text(
                "Enter your phone number for the verification proccesss, we will send 4 digits code to your phone number.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.defaultSize * 3),
              Obx(
                () => CustomTextField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  counterText: '',
                  hintText: "Phone Number",
                  controller: controller.forgetpasswordController,
                  errorText: controller.bootomseetpasswordError.value,
                ),
              ),
              SizedBox(height: SizeConfig.defaultSize * 2),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  controller.forgetPassword(
                      controller.forgetpasswordController.text, context);
                  // Get.back();
                  // if (controller.bottomseetpasswordvalidation()) {
                  //   Navigator.pop(context);
                  //   _showOTPBottomSheet(context);
                  // }
                },
              ),
              SizedBox(height: SizeConfig.defaultSize * 2),
            ],
          ),
        );
      },
    );
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
                  controller: controller.otpController,
                  keyboardType: TextInputType.number,
                  errorText: controller.otpError.value,
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
  }

  void _showsetBottomSheet(BuildContext context) {
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
                "Reset Password",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: SizeConfig.defaultSize),
              Text(
                "Set the new password for your account so you can login and access all the features.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.defaultSize * 3),
              Obx(
                () => CustomTextField(
                    hintText: "New Password",
                    controller: controller.resetpasswordController,
                    errorText: controller.resetpasswordError.value,
                    suffixIcon: IconButton(
                        icon: Icon(
                          controller.re_setpasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: controller.re_setpasswordVisibility)),
              ),
              SizedBox(height: SizeConfig.defaultSize),
              Obx(
                () => CustomTextField(
                  hintText: "Re-enter Password",
                  controller: controller.conformpasswordController,
                  errorText: controller.conformpasswordError.value,
                ),
              ),
              SizedBox(height: SizeConfig.defaultSize * 2),
              CustomButton(
                text: 'Update Password',
                onPressed: () {
                  if (controller.re_setpasswordvalidation()) {
                    // Navigator.pop(context);
                    Get.toNamed(Routes.HOME);
                  }
                  // _showOTPBottomSheet(context);
                },
              ),
              SizedBox(height: SizeConfig.defaultSize * 2),
            ],
          ),
        );
      },
    );
  }
}
