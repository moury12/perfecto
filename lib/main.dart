import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/color/custom_color.dart';
import 'package:perfecto/bindings/navigation_binding.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/home_page.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
  CustomColor.setPrimaryColor(AppColors.kPrimaryColor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfecto',
      theme: ThemeData.light(),
      getPages: AppRoutes.routes(),
      initialRoute: MainHomeScreen.routeName,
      initialBinding: NavigationBinding(),
    );
  }
}
