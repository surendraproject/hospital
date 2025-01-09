import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../theme/size_config.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/notifaction_controller.dart';

class NotifactionView extends GetView<NotifactionController> {
  const NotifactionView({super.key});

  String getCurrentTime() {
    // Format the current time
    return DateFormat('hh:mm a').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Stack(
      children: [
        const CustomGradientContainer2(
        
          txt: "Notification",
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.defaultSize,
                horizontal: SizeConfig.defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.defaultSize * 11),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Rectangle 506.png'),
                      radius: 30,
                    ),
                    SizedBox(width: SizeConfig.defaultSize),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nisha Mehta",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.defaultSize * 1.5,
                                    ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  """Lorem ipsum dolor sit amet, consectetur adipiscing elitdolor sit amet, consectetur adipiscing elit .""",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.defaultSize * 1.2,
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: SizeConfig.defaultSize),
                              Text(
                                // Displaying the current time
                                getCurrentTime(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: SizeConfig.defaultSize * 1.2,
                                      color: Colors.grey,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(width: SizeConfig.defaultSize),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
