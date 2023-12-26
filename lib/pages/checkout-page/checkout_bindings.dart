import 'package:get/get.dart';
import 'package:perfecto/pages/checkout-page/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CheckOutController>(CheckOutController(), );

  }
}