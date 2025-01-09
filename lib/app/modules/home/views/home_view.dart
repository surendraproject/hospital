import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hospital/app/routes/app_pages.dart';
import 'package:hospital/app/theme/size_config.dart';
import '../../../widgets/coustom_navigation_bar.dart';
import '../../side_bar/views/side_bar_view.dart';
import '../controllers/home_controller.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideBarView(),
      appBar: AppBar(
        // toolbarHeight: SizeConfig.defaultSize * 12,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.NOTIFACTION);
                    },
                    child: SvgPicture.asset("assets/icons/Vector (9).svg")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                    child: SvgPicture.asset("assets/icons/Group 11018.svg")),
              ),
            ],
          )
        ],
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff09CF9B),
        title: const Text(
          'Logo',
          style: TextStyle(color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: SizeConfig.defaultSize * 15,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    // Optional: Handle index updates in controller if needed
                    controller.count.value = index;
                  },
                ),
                items: controller.banners.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SvgPicture.asset(
                        banner,
                        fit: BoxFit.cover, // Ensure the image fits properly
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
          Positioned(
            top: SizeConfig.defaultSize * 2.8,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset(
                      'assets/icons/cencal.svg',
                      height: SizeConfig.defaultSize,
                      width: SizeConfig.defaultSize,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  labelText: "search",
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBarWidget(currentIndex: 0),
    );
  }
}
