

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';

import '../../../theme/theme.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/help_center_controller.dart';

class HelpCenterView extends GetView<HelpCenterController> {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
            txt: "Help Center",
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 9),
                  // Name Field
                  Obx(
                    () => TextFormField(
                      onChanged: (value) => controller.name.value = value,
                      // onChanged: controller.updateName,
                      decoration: InputDecoration(
                        hintText: 'Name',
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
                        // errorText: controller.nameError.value,
                         errorText: controller.nameError.value,
                    
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  // Email Field
                  Obx(
                    () => TextFormField(
                      onChanged: controller.updateEmail,
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                        errorText: controller.emailError.value,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  // Dropdown for Topics
                  Obx(
                    () => DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Choose your Topic',
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
                        errorText: controller.topicError.value,
                      ),
                      value: controller.selectedTopic.value.isEmpty
                          ? null
                          : controller.selectedTopic.value,
                      items: controller.topics.map((topic) {
                        return DropdownMenuItem<String>(value: topic, child: Text(topic));
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.updateSelectedTopic(value);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  // Textarea Field
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
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
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  GestureDetector(
                    onTap: () {
               

                      if (controller.isFormValid) {       controller.submitHelpCenterRequest();
                        // Handle submission logic here
                      } else {
                        controller.validateTopic();
                      }

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize,
                        vertical: SizeConfig.defaultSize,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
                        color: const Color(0xff0EBE7F),
                        boxShadow: const [
                          BoxShadow(blurRadius: 1, color: Colors.grey)
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: BasilTheme.whait.value,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.defaultSize * 2,
                              ),
                        ),
                      ),
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
