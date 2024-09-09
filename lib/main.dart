import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:perfecto/bindings/navigation_binding.dart';
import 'package:perfecto/constants/color_constants.dart';

import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/routes/app_routes.dart';
import 'package:perfecto/services/notification_service.dart';
import 'package:perfecto/splash_screen.dart';

import 'DB/database_helper.dart';
import 'services/fcm.dart';

import 'package:firebase_core/firebase_core.dart';

final dbHelper = DatabaseHelper();
NotificationService? service;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();
  try {
    await dbHelper.init();
  } catch (e) {
    globalLogger.e(e);
  }
  try {
    setupFirebaseMessenging();
  } catch (e) {
    globalLogger.e(e);
  }
  try {
    service = NotificationService();
  } catch (e) {
    globalLogger.e(e);
  }
  show500Error = false;
  show429Error = false;
  navigatorKey = GlobalKey<NavigatorState>();
  snackbarKey = GlobalKey<ScaffoldMessengerState>();
  Service.domain("https://app.perfectoblog.com/");
  Service.extraSlag("api/");
  // Service.setNeedLoadingMsg(false);
  // Service.setLoadingWidget(
  //   Image.asset(
  //     'assets/loading-c.gif',
  //     height: 30,
  //     width: 30,
  //   ),
  // );
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
      initialRoute: SplashScreen.routeName,
      initialBinding: NavigationBinding(),
    );
  }
}
