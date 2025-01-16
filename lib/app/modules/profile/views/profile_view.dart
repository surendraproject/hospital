import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/theme.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize,
                vertical: SizeConfig.defaultSize),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0EBE7E), Color(0xFF07D9AD)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeConfig.defaultSize * 3),
                bottomRight: Radius.circular(SizeConfig.defaultSize * 3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.defaultSize * 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child:
                            SvgPicture.asset('assets/icons/Chevron Left.svg')),
                    SizedBox(width: SizeConfig.defaultSize * 2),
                    Expanded(
                      child: Text(
                        "Profile",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: BasilTheme.whait.value,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 2),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.UPDATE_PROFILE);
                      },
                      child: Text(
                        "Edit",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: BasilTheme.whait.value,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 1.7),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Container(
                      //   height: SizeConfig.defaultSize * 16,
                      //   width: SizeConfig.defaultSize * 16,
                      //   decoration: const BoxDecoration(
                      //     shape: BoxShape.circle,
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Image.asset("assets/images/Doctor image.png"),
                      //   ),
                      // ),
                      Container(
                        height: SizeConfig.defaultSize * 16,
                        width: SizeConfig.defaultSize * 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: Obx(() {
                              return controller.selectedImage.value == null
                                  ? Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey,
                                      size: SizeConfig.defaultSize * 4,
                                    )
                                  : Image.file(
                                      controller.selectedImage.value!,
                                      fit: BoxFit.cover,
                                    );
                            }),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 10,
                        child: GestureDetector(
                          onTap: controller.pickImageFromCamera,
                          child: Container(
                            padding:
                                EdgeInsets.all(SizeConfig.defaultSize * 0.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: BasilTheme.whait.value,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: BasilTheme.black.value,
                              size: SizeConfig.defaultSize * 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Surendra kumawat",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: BasilTheme.whait.value,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize * 1.7),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "+91 9999999999",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: BasilTheme.whait.value,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize * 1.4),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize * 2,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.defaultSize,
                horizontal: SizeConfig.defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Personal information",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: BasilTheme.black.value,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.defaultSize * 2),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.defaultSize,
                      horizontal: SizeConfig.defaultSize),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xff1B8278),
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 1.4),
                      ),
                      Text(
                        "Pushpendra Singh",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 1.4),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.defaultSize,
                      horizontal: SizeConfig.defaultSize),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Number",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xff1B8278),
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 1.4),
                      ),
                      Text(
                        "+91 9999999999",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 1.4),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.defaultSize,
                      horizontal: SizeConfig.defaultSize),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            // ignore: prefer_const_constructors
                            color: Color(0xff1B8278),
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 1.4),
                      ),
                      Text(
                        "pushpendra@gmail.com",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 1.4),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
              ],
            ),
          )
        ],
      ),
    );
  }
}
