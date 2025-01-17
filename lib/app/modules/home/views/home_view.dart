import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hospital/app/routes/app_pages.dart';
import 'package:hospital/app/theme/size_config.dart';
import '../../../widgets/coustom_navigation_bar.dart';
import '../../side_bar/views/side_bar_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.offAllNamed(Routes.HOME);
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const SideBarView(),
        appBar: AppBar(
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
            SizedBox(height: SizeConfig.defaultSize),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize,
                  vertical: SizeConfig.defaultSize),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  Container(
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
                          borderRadius:
                              BorderRadius.circular(SizeConfig.defaultSize),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.defaultSize),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  Image.asset("assets/icons/Group 1 (1).png"),
                  Text(
                    'Healthcare',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xff1D2366),
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize * 5,
                        ),
                  ),
                  Text(
                    'Solutions',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xff006D77),
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize * 3,
                        ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  Text(
                    '''A doctor is someone who is experienced and 
      certified to practice medicine to help maintain 
       or restore physical and mental health.''',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xff006D77),
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize * 1.5,
                        ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 9),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: SizeConfig.defaultSize * 19,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0EBE7F),
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.defaultSize * 1.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.defaultSize * 0.8),
                          ),
                        ),
                        child: Text(
                          'Book Appointment',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.defaultSize * 1.5,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavBarWidget(currentIndex: 0),
      ),
    );
  }
}
