import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hospital/app/routes/app_pages.dart';
import 'package:hospital/app/theme/size_config.dart';
import '../controllers/side_bar_controller.dart';

class SideBarView extends GetView<SideBarController> {
  const SideBarView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0EBE7E),
              Color.fromRGBO(7, 217, 173, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.defaultSize * 4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.toNamed(Routes.PROFILE);
                          },
                          child: const CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        SizedBox(width: SizeConfig.defaultSize),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Pushpendra Singh",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                            Text(
                              "+91 9999999999",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.back(); // Pops the current screen
                            },
                            child: SvgPicture.asset(
                              "assets/icons/Frame 1171276611.svg",
                            ),
                          ),
                        )
                      ],
                    ),
                    // const SizedBox(height: 10),
                  ],
                ),
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/dashboard.svg',
                title: 'Dashboard',
                onTap: () {
                  Get.toNamed(Routes.HOME);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/about us icon.svg',
                title: 'About Us',
                onTap: () {
                  Get.toNamed(Routes.ABOUT_US);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/Group (7).svg',
                title: 'Category',
                onTap: () {
                  Get.toNamed(Routes.CATEGORY);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/appointment.svg',
                title: 'Book Appointment',
                onTap: () {
                  Get.toNamed(Routes.CATEGORY);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/Group (8).svg',
                title: 'Appointment History',
                onTap: () {
                  Get.toNamed(Routes.APPOINTMENT_HISTORY);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/Group (8).svg',
                title: 'Upcoming History',
                onTap: () {
                  Get.toNamed(Routes.UPCOMING_APPOINTMENT);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/File.svg',
                title: 'Upload Report',
                onTap: () {
                  Get.toNamed(Routes.UPLOAD_REPORT);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/File.svg',
                title: 'Report History',
                onTap: () {
                  Get.toNamed(Routes.REPORT_HISTORY);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/Vector (10).svg',
                title: 'Contact Us',
                onTap: () {
                  Get.toNamed(Routes.CONTACT_US);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/Term 1.svg',
                title: 'Terms & Conditions',
                onTap: () {
                  Get.toNamed(Routes.TERMS_CONDITION);
                },
                showDivider: true,
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/Privacy 1.svg',
                title: 'Privacy Policy',
                onTap: () {
                  Get.toNamed(Routes.PRIVACY_POLICY);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/Help 1.svg',
                title: 'Help Center',
                onTap: () {
                  Get.toNamed(Routes.HELP_CENTER);
                },
              ),
              MenuItem(
                svgAssetPath: 'assets/icons/Group 88.svg',
                title: 'Logout',
                onTap: () {
                  Get.toNamed(Routes.LOGIN);
                },
                showDivider: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String svgAssetPath;
  final String title;
  final VoidCallback onTap;
  final bool showDivider;

  const MenuItem({
    super.key,
    required this.svgAssetPath,
    required this.title,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: SvgPicture.asset(
            svgAssetPath,
            width: 24,
            height: 24,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: onTap,
        ),
        if (showDivider)
          const Divider(
            color: Colors.white54,
            thickness: 0.5,
          ),
      ],
    );
  }
}
