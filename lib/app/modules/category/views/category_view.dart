import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';

import '../../../widgets/coustom_continer.dart';
import '../../../widgets/coustom_navigation_bar.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBarWidget(currentIndex: 2),
      body: Stack(
        children: [
          const CustomGradientContainer2(
            txt: "Categories",
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize * 2,
                vertical: SizeConfig.defaultSize * 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 5),
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
                  SizedBox(height: SizeConfig.defaultSize),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.defaultSize,
                        horizontal: SizeConfig.defaultSize),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(blurRadius: 2, color: Colors.grey)
                        ],
                        borderRadius:
                            BorderRadius.circular(SizeConfig.defaultSize)),
                    child: Row(
                      children: [
                        Text(
                          "Step 1/3",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.defaultSize * 1.5,
                                  ),
                        ),
                        SizedBox(width: SizeConfig.defaultSize),
                        SvgPicture.asset('assets/icons/Group (5).svg')
                      ],
                    ),
                  ),
                  GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                    
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.defaultSize,
                            vertical: SizeConfig.defaultSize),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(blurRadius: 2, color: Colors.grey)
                            ],
                            borderRadius:
                                BorderRadius.circular(SizeConfig.defaultSize)),
                        child: Column(
                          children: [
                            SizedBox(height: SizeConfig.defaultSize * 2),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.defaultSize,
                                  horizontal: SizeConfig.defaultSize),
                              decoration: BoxDecoration(
                                  color: const Color(0xffC6EFE5C2),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.defaultSize * 8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    "assets/icons/Group 11023.svg"),
                              ),
                            ),
                            SizedBox(height: SizeConfig.defaultSize),
                            Text(
                              "Cardiology",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: const Color(0xff677294),
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.defaultSize * 1.5,
                                  ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
