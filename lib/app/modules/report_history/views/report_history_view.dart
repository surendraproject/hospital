import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/app/widgets/coustom_continer.dart';
import '../../../theme/size_config.dart';
import '../controllers/report_history_controller.dart';

class ReportHistoryView extends GetView<ReportHistoryController> {
  const ReportHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
            // ignore: sort_child_properties_last
            child: SizedBox.expand(),
            txt: "Report History",
          ),
          SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 2,
                  vertical: SizeConfig.defaultSize * 5,
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 8,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.defaultSize * 2),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.defaultSize,
                              vertical: SizeConfig.defaultSize),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(blurRadius: 2, color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.defaultSize)),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Dr. Shruti Kedia',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        SizeConfig.defaultSize *
                                                            1.4),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.defaultSize * 0.5),
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
                                                        SizeConfig.defaultSize *
                                                            1.4),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.defaultSize * 0.5),
                                        Flexible(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '10:00 AM ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: SizeConfig
                                                                .defaultSize *
                                                            1.4),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          SizeConfig
                                                                  .defaultSize *
                                                              0.5),
                                                  color: const Color(0xff0EBE7F1A),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '  Download  ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                            color: const Color(
                                                                0xff0EBE7F),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: SizeConfig
                                                                    .defaultSize *
                                                                1.5,
                                                          ),
                                                    ),
                                                    Image.asset(
                                                        'assets/images/Group 11047.png')
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

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
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
