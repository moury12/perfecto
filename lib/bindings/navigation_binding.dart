import 'package:get/get.dart';
import 'package:perfecto/controller/navigation_controller.dart';

import '../pages/home/controller/home_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(
      NavigationController(),
    );

    Get.put<HomeController>(
      HomeController(),
    );
  }
}
