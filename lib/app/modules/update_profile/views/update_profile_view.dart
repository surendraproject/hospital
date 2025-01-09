import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../theme/size_config.dart';
import '../../../theme/theme.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  const UpdateProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
            txt: "Update Profile",
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
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/File.svg',
                          height: SizeConfig.defaultSize,
                          width: SizeConfig.defaultSize,
                        ),
                      ),
                      hintText: "Update your profile picture",
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
                  customtextfild(
                    'Name',
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                        height: SizeConfig.defaultSize,
                        width: SizeConfig.defaultSize,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  customtextfild(
                    'phone',
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/Email.svg',
                        height: SizeConfig.defaultSize,
                        width: SizeConfig.defaultSize,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  customtextfild(
                    'Email',
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/sms.svg',
                        height: SizeConfig.defaultSize,
                        width: SizeConfig.defaultSize,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  customtextfild(
                      'Enter your password',
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/Password.svg',
                          height: SizeConfig.defaultSize,
                          width: SizeConfig.defaultSize,
                        ),
                        //  icon(Icon(Icons.visibility))
                      )),
                  SizedBox(height: SizeConfig.defaultSize),
                  customtextfild(
                      'Re-enter your password',
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/Password.svg',
                          height: SizeConfig.defaultSize,
                          width: SizeConfig.defaultSize,
                        ),
                        //  icon(Icon(Icons.visibility))
                      )),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize,
                        vertical: SizeConfig.defaultSize),
                    // height: 50,
                    // width: 150,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize),
                      color: const Color(0xff0EBE7F),
                      boxShadow: const [BoxShadow(blurRadius: 1, color: Colors.grey)],
                    ),
                    child: Center(
                      child: Text(
                        "Update",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: BasilTheme.whait.value,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 2),
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

  TextFormField customtextfild(String? hintText, Widget? prefixIcon,
      [Widget? suffixIcon]) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
          borderSide: const BorderSide(
            color: Color(0x67729429),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
          borderSide: const BorderSide(
            color: Color(0xFF677294),
          ),
        ),
      ),
    );
  }
}
