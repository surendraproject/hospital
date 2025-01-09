import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/size_config.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/appointment_history_controller.dart';

class AppointmentHistoryView extends GetView<AppointmentHistoryController> {
  const AppointmentHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
            // ignore: sort_child_properties_last
            child: SizedBox.expand(),
            txt: "Appointment History",
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
                  SizedBox(height: SizeConfig.defaultSize * 9),
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
                                      '10:00 AM ',
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
                                  SizedBox(height: SizeConfig.defaultSize),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.defaultSize * 0.5),
                                        color: const Color(0xff0EBE7F1A),
                                      ),
                                      child: Text(
                                        '  1 Prescription  ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: const Color(0xff0EBE7F),
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  SizeConfig.defaultSize * 1.5,
                                            ),
                                      ),
                                    ),
                                  )

                                  // Rating count
                                ],
                              ),
                            ),
                          ],
                        ),
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
