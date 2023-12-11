import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';

class ProductDetailsController extends GetxController  with GetTickerProviderStateMixin {
  static ProductDetailsController get to => Get.find();
   TabController? tabController;
   TabController? tabController2;
 RxBool isFavourite=false.obs;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController2 = TabController(length: tabTiles2.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  List<String> tabTiles = ['All Shades', 'Bestsellers'];
  List<String> tabTiles2 = ['Description', 'Ingredients','How to Use','FAQ'];
  var currentIndex = 0.obs;
  var currentIndex2 = 0.obs;
  var currentPage = 0.obs;
  List<dynamic> bannerContent = [
AssetsConstant.megaDeals2,AssetsConstant.megaDeals1,AssetsConstant.megaDeals3  ];

}