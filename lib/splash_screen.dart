import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/pages/page_with_navigation.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAllNamed(MainHomeScreen.routeName);
      },
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetsConstant.perfectoLogo,
          height: 80,
          width: Get.width * .7,
        ),
      ),
    );
  }
}
