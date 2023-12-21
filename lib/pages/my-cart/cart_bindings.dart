import 'package:get/get.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/my-cart/cart_controller.dart';




class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartController>(CartController(), );
  }
}