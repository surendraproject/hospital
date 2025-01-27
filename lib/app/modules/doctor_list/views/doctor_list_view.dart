import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';
import 'package:hospital/app/widgets/coustom_continer.dart';
import '../../../widgets/coustom_navigation_bar.dart';
import '../controllers/doctor_list_controller.dart';

class DoctorListView extends GetView<DoctorListController> {
  const DoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBarWidget(currentIndex: 1),
      body: Stack(
        children: [
          const CustomGradientContainer2(
            txt: "Doctor List",
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
                            color: Colors
                                .white, // Border color for the enabled state
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.defaultSize),
                          borderSide: const BorderSide(
                            color: Colors
                                .white, // Border color for the focused state
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
                          "Step 2/3",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.defaultSize * 1.5,
                                  ),
                        ),
                        SizedBox(width: SizeConfig.defaultSize),
                        SvgPicture.asset('assets/icons/Group (6).svg')
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 4),
                  Container(
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: SizeConfig.defaultSize,
                    //     vertical: SizeConfig.defaultSize),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: SizeConfig.defaultSize * 12,
                                height: SizeConfig.defaultSize * 12,
                                child: Image.asset(
                                    'assets/images/Rectangle 506.png')),
                            SizedBox(width: SizeConfig.defaultSize * 0.8),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: SizeConfig.defaultSize * 0.5),
                                  Flexible(
                                    child: Text(
                                      'Dr. Shruti Kedia',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  SizeConfig.defaultSize * 1.4),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                      height: SizeConfig.defaultSize * 0.5),
                                  Flexible(
                                    child: Text(
                                      'Specilist medicine',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  SizeConfig.defaultSize * 1.4),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                      height: SizeConfig.defaultSize * 0.5),
                                  Flexible(
                                    child: Text(
                                      '6 Years experience ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  SizeConfig.defaultSize * 1.4),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(5, (index) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: SizeConfig.defaultSize * 1.9,
                                      );
                                    }),
                                  ),
                                  SizedBox(width: SizeConfig.defaultSize * 0.5),

                                  // Rating count
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: List.generate(3, (index) {
                            return GestureDetector(
                              onTap: () {
                                controller.updateSelectedIndex(
                                    index); // Update selected index
                              },
                              child: Obx(() {
                                // Check if this container is selected
                                bool isSelected =
                                    controller.selectedIndex.value == index;
                                return Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.defaultSize * 0.5,
                                      vertical: SizeConfig.defaultSize * 0.5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.green
                                          : Colors
                                              .transparent, // Green border for selected item
                                    ),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 2, color: Colors.grey),
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.defaultSize),
                                  ),
                                  child: SvgPicture.asset(
                                    index == 0
                                        ? "assets/icons/Group 18.svg"
                                        : index == 1
                                            ? "assets/icons/Vector (4).svg"
                                            : "assets/icons/Vector (5).svg",
                                    color:
                                        isSelected ? Colors.green : Colors.grey,
                                  ),
                                );
                              }),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
