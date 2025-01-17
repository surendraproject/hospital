import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:hospital/app/theme/size_config.dart';

import '../../../theme/theme.dart';
import '../../../widgets/coustom_continer.dart';
import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> {
  const ReviewView({super.key});

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: SvgPicture.asset('assets/icons/Group (4).svg'),
          content: Text(
            """Thank you for sharing  your valuable feedback""",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xff677294),
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.defaultSize * 2),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultSize,
                  horizontal: SizeConfig.defaultSize),
              decoration: const BoxDecoration(
                color: Color(0xff0EBE7F),
                boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey)],
              ),
              child: Center(
                child: Text(
                  "Back To Home",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: BasilTheme.whait.value,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.defaultSize * 2),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          const CustomGradientContainer2(
            txt: "Review",
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.defaultSize * 9),
                  const Center(
                      child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                  )),
                  SizedBox(height: SizeConfig.defaultSize),
                  Center(
                    child: Text(
                      "How was your experience with ",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize * 2),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Dr. Shruti Kedia",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize * 2),
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: SizeConfig.defaultSize * 5,
                      );
                    }),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: BasilTheme.Lightgray.value,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.defaultSize),
                          borderSide: BorderSide(
                            color: BasilTheme.Lightgray.value,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Write your review here...',
                      ),
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: SizeConfig.defaultSize * 2,
                            );
                          }),
                        ),
                        title: Text(
                          "Amris",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.defaultSize * 1.8,
                                  ),
                        ),
                        leading: const CircleAvatar(),
                        subtitle: Text(
                          "Patient",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: BasilTheme.gray.value,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.defaultSize * 1,
                                  ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: SizeConfig.defaultSize),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _showThankYouDialog(context); // Show dialog on tap
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Color(0xff0EBE7F),
                          boxShadow: [
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
                                    fontSize: SizeConfig.defaultSize * 2),
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
