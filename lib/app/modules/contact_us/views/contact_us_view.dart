import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';

import '../../../widgets/coustom_continer.dart';
import '../../../widgets/coustom_navigation_bar.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBarWidget(currentIndex: 3),
      body: Stack(
        children: [
          const CustomGradientContainer2(txt: "Contact Us"),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 15),
                  Text(
                    "CONTACT SUPPORT",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0EBE7F),
                          fontSize: SizeConfig.defaultSize * 2,
                        ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  Text(
                    "TALK TO A SUPPORT AGENT",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0EBE7F),
                          fontSize: SizeConfig.defaultSize * 1.2,
                        ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  Obx(() {
                    final phone =
                        controller.contactData.value?.phoneNo.toString();

                    return Text(
                      phone ?? "",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: SizeConfig.defaultSize * 1.2,
                          ),
                    );
                  }),

                  SizedBox(height: SizeConfig.defaultSize),
                  Text(
                    "WRITE TO US",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0EBE7F),
                          fontSize: SizeConfig.defaultSize * 1.1,
                        ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  Obx(() {
                    final email =
                        controller.contactData.value?.email.toString();
                    return Text(
                      email ?? "",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff464646),
                            fontSize: SizeConfig.defaultSize * 1.7,
                          ),
                    );
                  }),
                  SizedBox(height: SizeConfig.defaultSize),
                  Text(
                    "VISIT",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0EBE7F),
                          fontSize: SizeConfig.defaultSize * 1.7,
                        ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),

                  Obx(() {
                    final address =
                        controller.contactData.value?.address.toString();
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                        address ?? "",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              // decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff464646),
                              fontSize: SizeConfig.defaultSize * 1.3,
                            ),
                      ),
                    );
                  }),

                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "Showroom, Hawa Sadak, Civil Lines, Jaipur,",
                  //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  //           fontWeight: FontWeight.bold,
                  //           color: const Color(0xff464646),
                  //           fontSize: SizeConfig.defaultSize * 1.3,
                  //         ),
                  //   ),
                  // ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "Rajasthan 302019",
                  //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  //           fontWeight: FontWeight.bold,
                  //           color: const Color(0xff464646),
                  //           fontSize: SizeConfig.defaultSize * 1.3,
                  //         ),
                  //   ),
                  // ),
                  Image.asset("assets/images/Group 637.png"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
