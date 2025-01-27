import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/size_config.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
            txt: "Privacy policy",
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
                  "Medical App Privacy Policy",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: SizeConfig.defaultSize * 1.7,
                      ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                Obx(() {
                  final description =
                      controller.privacyData.value?.description.toString();
                  return Text(
                    description ?? "",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff959CB4CC),
                          fontSize: SizeConfig.defaultSize * 1.7,
                        ),
                  );
                })
              ],
            ),
          )),
        ],
      ),
    );
  }
}
