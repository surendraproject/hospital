import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';
import 'package:hospital/app/theme/theme.dart';

class CustomGradientContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const CustomGradientContainer({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff61CEFF).withOpacity(0.7),
            const Color(0xffFFFFFF),
            const Color(0xffFFFFFF),
            const Color(0xffFFFFFF),
            const Color(0xff0EBE7E).withOpacity(0.1),
          ],
          stops: const [0.0, 0.2, 0.5, 0.85, 1.0],
        ),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}

class CustomGradientContainer2 extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final String txt;

  const CustomGradientContainer2({
    super.key,
    this.child,
    this.padding,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff61CEFF).withOpacity(0.7),
            const Color(0xffFFFFFF),
            const Color(0xffFFFFFF),
            const Color(0xffFFFFFF),
            const Color(0xff0EBE7E).withOpacity(0.1),
          ],
          stops: const [0.0, 0.2, 0.5, 0.85, 1.0],
        ),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize * 4,
              horizontal: SizeConfig.defaultSize),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    height: SizeConfig.defaultSize * 3.5,
                    width: SizeConfig.defaultSize * 3.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(SizeConfig.defaultSize)),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.grey),
                    )),
              ),
              SizedBox(width: SizeConfig.defaultSize * 2.5),
              Text(
                txt,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: BasilTheme.black.value,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.defaultSize * 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
