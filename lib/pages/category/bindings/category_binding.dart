import 'package:get/get.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';




class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController(), );
  }
}