import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';




class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchController>(SearchController(), );
    Get.put<NavigationController>(NavigationController(), );
    Get.put<CategoryController>(CategoryController(), );
  }
}