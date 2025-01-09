import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(    const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(

    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HOSPITAL",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes),
  

  );
}
