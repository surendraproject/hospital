import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../theme/size_config.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/upcoming_appointment_controller.dart';

class UpcomingAppointmentView extends GetView<UpcomingAppointmentController> {
  const UpcomingAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
           
            txt: "Upcoming Appointment",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize * 2,
              vertical: SizeConfig.defaultSize * 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize * 4,
                ),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
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
                                  width: SizeConfig.defaultSize * 10,
                                  height: SizeConfig.defaultSize * 10,
                                  child: Image.asset(
                                      'assets/images/Rectangle 506.png')),
                              SizedBox(width: SizeConfig.defaultSize * 0.8),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: SizeConfig.defaultSize * 0.5),
                                    Text(
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
                                    SizedBox(
                                        height: SizeConfig.defaultSize * 0.5),
                                    Text(
                                      'Thu, October 2024',
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
                                    SizedBox(
                                        height: SizeConfig.defaultSize * 0.5),
                                    Text(
                                      '10:00 AM - 10:15 AM',
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.defaultSize * 2,
                                  horizontal: SizeConfig.defaultSize * 2,
                                ),
                                child: SizedBox(
                                    width: SizeConfig.defaultSize * 7,
                                    height: SizeConfig.defaultSize * 7,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.defaultSize)),
                                      child: SvgPicture.asset(
                                        index == 0
                                            ? 'assets/icons/Frame 29.svg'
                                            : index == 1
                                                ? 'assets/icons/Frame 28.svg'
                                                : 'assets/icons/Frame 31 (1).svg',
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
