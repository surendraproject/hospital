import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hospital/app/routes/app_pages.dart';
import 'package:hospital/app/theme/size_config.dart';
import 'package:hospital/app/widgets/coustom_button.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
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
          child: Column(
            children: [
              SizedBox(height: SizeConfig.defaultSize * 12),
              SvgPicture.asset(
                'assets/icons/splesh.svg',
              ),
              SizedBox(height: SizeConfig.defaultSize * 7),
              SvgPicture.asset(
                'assets/icons/hosptial.svg',
                height: SizeConfig.defaultSize * 16,
              ),
              SizedBox(height: SizeConfig.defaultSize * 3),
              CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  }),
              SizedBox(height: SizeConfig.defaultSize * 2),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
