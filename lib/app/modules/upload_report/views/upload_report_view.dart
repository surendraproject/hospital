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
              padding: EdgeInsets.all(SizeConfig.defaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 9),
                  _buildDottedUploadBox(context),
                  SizedBox(height: SizeConfig.defaultSize),
                  _buildTextSection(
                    context,
                    title: 'Record for',
                    subtitle: 'Nisha Mehta',
                  ),
                  // _buildUploadingStatus(),
                  SizedBox(height: SizeConfig.defaultSize),
                  // _buildUploadedFilesList(context),
                  // SizedBox(height: SizeConfig.defaultSize),
                  _buildTextSection(
                    context,
                    title: 'Uploaded',
                  ),
                  _buildUploadedImagesList(context),
                  SizedBox(height: SizeConfig.defaultSize),
                   Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize,
                        vertical: SizeConfig.defaultSize,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.defaultSize*0.5),
                        color: const Color(0xff0EBE7F),
                        boxShadow: const [
                          BoxShadow(blurRadius: 1, color: Colors.grey)
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Upload Files",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDottedUploadBox(BuildContext context) {
    return DottedBorder(
      color: const Color(0xffE6E9F6),
      strokeWidth: 2,
      dashPattern: const [6, 4],
      radius: Radius.circular(SizeConfig.defaultSize),
      child: InkWell(
        onTap: controller.pickMultipleImages,
        child: Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize),
          color: const Color(0xffF8F8FF),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/Upload icon.svg'),
                SizedBox(height: SizeConfig.defaultSize),
                RichText(
                  text: TextSpan(
                    text: 'Drag & drop files or ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize * 1.5,
                        ),
                    children: [
                      TextSpan(
                        text: 'Browse',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              decoration: TextDecoration.underline,
                              color: const BasilTheme().primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultSize * 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize),
                Text(
                  "Supported formats: JPEG, PNG",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize * 1.5,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(BuildContext context,
      {required String title, String? subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xff676767),
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.defaultSize * 2,
              ),
        ),
        if (subtitle != null) SizedBox(height: SizeConfig.defaultSize),
        if (subtitle != null)
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xff0EBE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.defaultSize * 1.5,
                ),
          ),
      ],
    );
  }


  // ignore: unused_element
  Widget _buildUploadedFilesList(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize * 4.3,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff0EBE7F)),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 2, color: Colors.grey),
        ],
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 0.5),
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("your-file-here.PDF"),
            SvgPicture.asset('assets/icons/Delete.svg'),
          ],
        ),
      ),
    );
  }

  
Widget _buildUploadedImagesList(BuildContext context) {
  SizeConfig().init(context);
  return Obx(() {
    if (controller.selectedImages.isEmpty) {
      return  
      Center(
        child: 
        Text(
          'No images uploaded yet.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: SizeConfig.defaultSize * 1.5,
          ),
        ),
      );
    }

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.selectedImages.length,
      itemBuilder: (context, index) {
        final image = controller.selectedImages[index];
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => Dialog(
                insetPadding: EdgeInsets.zero, // Removes default dialog padding
                backgroundColor: Colors.transparent, // Makes the dialog transparent
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.8), // Background overlay
                  child: Stack(
                    children: [
                      Center(
                        child: Image.file(
                          image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: SizeConfig.defaultSize),
            padding: EdgeInsets.all(SizeConfig.defaultSize),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff0EBE7F)),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.grey,
                ),
              ],
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(image.path.split('/').last),
                InkWell(  
                  onTap: () => controller.removeImage(index),
                  child: SvgPicture.asset('assets/icons/Delete.svg',height: SizeConfig.defaultSize*3,),
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}
}