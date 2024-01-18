import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:mh_core/services/api_service.dart';
import 'package:mh_core/utils/color/custom_color.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/bindings/navigation_binding.dart';
import 'package:perfecto/constants/color_constants.dart';

import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/routes/app_routes.dart';

import 'DB/database_helper.dart';

final dbHelper = DatabaseHelper();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  await dbHelper.init();
  navigatorKey = GlobalKey<NavigatorState>();
  snackbarKey = GlobalKey<ScaffoldMessengerState>();
  ServiceAPI.domain("https://perfecto.fixican.com/");
  ServiceAPI.extraSlag("api/");
  CustomColor.setPrimaryColor(AppColors.kPrimaryColor);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: snackbarKey,
      title: 'Perfecto',
      theme: ThemeData.light(),
      getPages: AppRoutes.routes(),
      initialRoute: MainHomeScreen.routeName,
      initialBinding: NavigationBinding(),
    );
  }
}
