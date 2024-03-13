import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:perfecto/bindings/navigation_binding.dart';
import 'package:perfecto/constants/color_constants.dart';

import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/routes/app_routes.dart';

import 'DB/database_helper.dart';

final dbHelper = DatabaseHelper();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dbHelper.init();
  } catch (e) {
    globalLogger.e(e);
  }
  navigatorKey = GlobalKey<NavigatorState>();
  snackbarKey = GlobalKey<ScaffoldMessengerState>();
  Service.domain("http://perfecto.fixican.com/");
  // ServiceAPI.domain("http://192.168.1.245:88/");
  Service.extraSlag("api/");
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
