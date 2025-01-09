import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';

import '../../../widgets/coustom_continer.dart';
import '../controllers/about_us_controller.dart';

class AboutUsView extends GetView<AboutUsController> {
  const AboutUsView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
            txt: "About Us",
          ),
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.defaultSize * 9),
                Text(
                  "About Us",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: SizeConfig.defaultSize * 1.7,
                      ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                Text(
                  """There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more """,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff959CB4CC),
                        fontSize: SizeConfig.defaultSize * 1.7,
                      ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
