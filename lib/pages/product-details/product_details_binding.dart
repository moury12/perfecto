
import 'package:get/get.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductDetailsController>(ProductDetailsController(), );
  }
}