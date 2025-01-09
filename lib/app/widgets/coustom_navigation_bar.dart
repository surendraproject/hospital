import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';
import '../routes/app_pages.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.defaultSize * 2),
        topRight: Radius.circular(SizeConfig.defaultSize * 2),
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xff0EBE7E),
        items: [
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff07D9AD),
            icon: SvgPicture.asset('assets/icons/Vector (6).svg'),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff07D9AD),
            icon: SvgPicture.asset(
              'assets/icons/Vector (7).svg',
            ),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff07D9AD),
            icon: SvgPicture.asset(
              'assets/icons/Vector (8).svg',
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff07D9AD),
            icon: SvgPicture.asset(
              'assets/icons/Group 11061.svg',
            ),
            label: 'Contact',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xffFFFFFF),
        selectedLabelStyle: Get.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontSize: SizeConfig.defaultSize * 1.3,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: Get.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontSize: SizeConfig.defaultSize,
          fontWeight: FontWeight.bold,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offNamedUntil(Routes.HOME, ModalRoute.withName(Routes.HOME));
              break;
            case 1:
              Get.offNamedUntil(
                  Routes.DOCTOR_LIST, ModalRoute.withName(Routes.HOME));

              break;
            case 2:
              Get.offNamedUntil(
                  Routes.CATEGORY, ModalRoute.withName(Routes.HOME));
              break;
            case 3:
              Get.offNamedUntil(
                  Routes.CONTACT_US, ModalRoute.withName(Routes.HOME));
              break;
          }
        },
      ),
    );
  }
}
