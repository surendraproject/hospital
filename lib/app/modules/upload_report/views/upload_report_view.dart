import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hospital/app/theme/size_config.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../theme/theme.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/upload_report_controller.dart';

class UploadReportView extends GetView<UploadReportController> {
  const UploadReportView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
            txt: "Upload Report",
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
                  SizedBox(height: SizeConfig.defaultSize * 9),
                  DottedBorder(
                    color: Color(0xffE6E9F6),
                    strokeWidth: 2,
                    dashPattern: [6, 4],
                    // borderType: BorderType.RRect,
                    radius: Radius.circular(SizeConfig.defaultSize),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.defaultSize,
                          horizontal: SizeConfig.defaultSize),
                      // height: 100,
                      // width: 200,
                      color: Color(0xffF8F8FF),
                      child: Center(
                          child: Column(
                        children: [
                          SizedBox(height: SizeConfig.defaultSize),
                          SvgPicture.asset('assets/icons/Upload icon.svg'),
                          SizedBox(height: SizeConfig.defaultSize),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Drag & drop files or ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.defaultSize * 1.5,
                                    ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Browse',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          decoration: TextDecoration.underline,
                                          color:
                                              const BasilTheme().primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.defaultSize * 1.5,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.defaultSize),
                          Text(
                            "Supported formates: JPEG, PNG,PDF,Word",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.defaultSize * 1.5,
                                    ),
                          )
                        ],
                      )),
                    ),
                  ),

                  // InkWell(
                  //     onTap: () {},
                  //     child: SvgPicture.asset(
                  //         "assets/icons/File upload area.svg")),

                  SizedBox(height: SizeConfig.defaultSize),
                  Text(
                    'Record for',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xff676767),
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize * 2),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  Text('Nisha Mehta',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xff0EBE7F),
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize * 2)),
                  SizedBox(height: SizeConfig.defaultSize),
                  Text('Uploading - 3/3 files',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xff676767),
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize * 1.8)),
                  SizedBox(height: SizeConfig.defaultSize),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: SizeConfig.defaultSize,
                          horizontal: SizeConfig.defaultSize),
                      hintText: 'your-file-here.PDF',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
