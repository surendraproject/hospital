import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/initializer.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  await Initializer.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(
    GetMaterialApp(
        theme: const BasilTheme().toThemeData(),
        debugShowCheckedModeBanner: false,
        title: "HOSPITAL",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes),
  );
}
