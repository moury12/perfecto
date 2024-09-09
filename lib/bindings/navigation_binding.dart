import 'package:get/get.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/drawer/drawer_controller.dart';
import 'package:perfecto/pages/chat/chat_controller.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';

import '../controller/home_api_controller.dart';
import '../controller/user_controller.dart';
import '../pages/home/controller/home_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
      permanent: true,
    );
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );Get.put<ChatController>(
      ChatController(),
      permanent: true,
    );

    Get.put<HomeApiController>(
      HomeApiController(),
      permanent: true,
    );
    Get.put<NavigationController>(
      NavigationController(),
      permanent: true,
    );
    Get.put<CustomDrawerController>(
      CustomDrawerController(),
      permanent: true,
    );
  }
}
