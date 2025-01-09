import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../theme/size_config.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/appointment_controller.dart';

class AppointmentView extends GetView<AppointmentController> {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(txt: "Appointment"),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize * 2,
                vertical: SizeConfig.defaultSize * 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 5),
                  _buildStepIndicator(context),
                  SizedBox(height: SizeConfig.defaultSize),
                  _buildDoctorCard(context),
                  SizedBox(height: SizeConfig.defaultSize),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize,
                      vertical: SizeConfig.defaultSize,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.grey)
                      ],
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Appointment Date*",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.defaultSize * 1.4,
                                  ),
                        ),
                        SizedBox(height: SizeConfig.defaultSize),
                        Obx(() {
                          final formattedDate = DateFormat('yyyy-MM-dd')
                              .format(controller.selectedDate.value);
                          return TextFormField(
                            readOnly: true,
                            onTap: () async {
                              final selected = await showDatePicker(
                                context: context,
                                initialDate: controller.selectedDate.value,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (selected != null) {
                                controller.updateDate(selected);
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  "assets/icons/Frame 1171276626.svg",
                                ),
                              ),
                              hintText: formattedDate,
                              hintStyle: const TextStyle(color: Colors.grey),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                                borderSide:
                                    const BorderSide(color: Color(0x67729429)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                                borderSide:
                                    const BorderSide(color: Color(0xFF677294)),
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: SizeConfig.defaultSize),
                        Text(
                          "Appointment Time*",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.defaultSize * 1.4,
                                  ),
                        ),
                        SizedBox(height: SizeConfig.defaultSize),
                        Obx(() {
                          final formattedTime =
                              controller.selectedTime.value.format(context);
                          return TextFormField(
                            readOnly: true,
                            onTap: () async {
                              final selected = await showTimePicker(
                                context: context,
                                initialTime: controller.selectedTime.value,
                              );
                              if (selected != null) {
                                controller.updateTime(selected);
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                    "assets/icons/Vector (3).svg"),
                              ),
                              hintText: formattedTime,
                              hintStyle: const TextStyle(color: Colors.grey),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                                borderSide:
                                    const BorderSide(color: Color(0x67729429)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize),
                                borderSide:
                                    const BorderSide(color: Color(0xFF677294)),
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: SizeConfig.defaultSize),
                        Text(
                          "Details",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.defaultSize * 1.4),
                        ),
                        SizedBox(height: SizeConfig.defaultSize),
                        TextFormField(
                          maxLines: 2,
                          decoration: InputDecoration(
                            suffixIcon: const Padding(
                              padding: EdgeInsets.all(12.0),
                            ),
                            hintText: 'Write here...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(SizeConfig.defaultSize),
                              borderSide: const BorderSide(
                                color: Color(0x67729429),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(SizeConfig.defaultSize),
                              borderSide: const BorderSide(
                                color: Color(0xFF677294),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.defaultSize),
                        Text(
                          "Select Appointment Type*",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.defaultSize * 1.4),
                        ),
                        SizedBox(height: SizeConfig.defaultSize),
                        // Row(
                        //   children: [
                        //     Container(
                        //       // height: SizeConfig.defaultSize * 2,
                        //       // width: SizeConfig.defaultSize * 3.0,
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: SizeConfig.defaultSize * 2,
                        //           vertical: SizeConfig.defaultSize * 2),
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           boxShadow: const [
                        //             BoxShadow(blurRadius: 2, color: Colors.grey)
                        //           ],
                        //           borderRadius: BorderRadius.circular(
                        //               SizeConfig.defaultSize)),
                        //       child:
                        //           SvgPicture.asset("assets/icons/Group 18.svg",color: ,),
                        //     ),
                        //     SizedBox(width: SizeConfig.defaultSize),
                        //     Container(
                        //       // height: SizeConfig.defaultSize * 2,
                        //       // width: SizeConfig.defaultSize * 3.0,
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: SizeConfig.defaultSize * 2,
                        //           vertical: SizeConfig.defaultSize * 2),
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           boxShadow: const [
                        //             BoxShadow(blurRadius: 2, color: Colors.grey)
                        //           ],
                        //           borderRadius: BorderRadius.circular(
                        //               SizeConfig.defaultSize)),
                        //       child: SvgPicture.asset(
                        //           "assets/icons/Vector (4).svg",color: ,),
                        //     ),
                        //     SizedBox(width: SizeConfig.defaultSize),
                        //     Container(

                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: SizeConfig.defaultSize * 2,
                        //           vertical: SizeConfig.defaultSize * 2),
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           boxShadow: const [
                        //             BoxShadow(blurRadius: 2, color: Colors.grey)
                        //           ],
                        //           borderRadius: BorderRadius.circular(
                        //               SizeConfig.defaultSize)),
                        //       child: SvgPicture.asset(
                        //           "assets/icons/Vector (5).svg",color: ,),
                        //     )
                        //   ],
                        // ),
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
                                      horizontal: SizeConfig.defaultSize,
                                      vertical: SizeConfig.defaultSize),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.green
                                          : Colors
                                              .transparent, // Green border for selected item
                                    ),
                                    color: Colors.white,
                                    // color: isSelected
                                    //     ? Colors.green
                                    //     : Colors.white,
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
                  SizedBox(height: SizeConfig.defaultSize),
                  SizedBox(
                    width: double.maxFinite,
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
                        'Pay Now',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultSize * 1.5,
                            ),
                      ),
                    ),
                  ),

                  // _buildAppointmentForm(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.defaultSize,
        horizontal: SizeConfig.defaultSize,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.grey)],
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
      ),
      child: Row(
        children: [
          Text(
            "Step 1/3",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.defaultSize * 1.5,
                ),
          ),
          SizedBox(width: SizeConfig.defaultSize),
          SvgPicture.asset('assets/icons/Group (5).svg'),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultSize,
        vertical: SizeConfig.defaultSize,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.grey)],
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConfig.defaultSize * 9,
            height: SizeConfig.defaultSize * 9,
            child: Image.asset('assets/images/Rectangle 506.png'),
          ),
          SizedBox(width: SizeConfig.defaultSize * 0.8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Shruti Kedia',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize * 1.4,
                      ),
                ),
                Text(
                  'Thu, October 2024',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize * 1.4,
                      ),
                ),
                Text(
                  '₹500',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize * 1.4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
