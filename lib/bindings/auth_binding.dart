import 'package:get/get.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/drawer/drawer_controller.dart';
import 'package:perfecto/pages/chat/chat_controller.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';

import '../pages/home/controller/home_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
    );


  }
}