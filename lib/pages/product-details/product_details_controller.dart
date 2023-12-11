import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';

class ProductDetailsController extends GetxController  with GetSingleTickerProviderStateMixin{
  static ProductDetailsController get to => Get.find();
   TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  List<String> tabTiles = ['All Shades', 'Bestsellers'];
  var currentIndex = 0.obs;
  var currentPage = 0.obs;
  List<dynamic> bannerContent = [
AssetsConstant.megaDeals2,AssetsConstant.megaDeals1,AssetsConstant.megaDeals3  ];

}