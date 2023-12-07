import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/assets_constants.dart';

class ProductDetailsController extends GetxController  with GetSingleTickerProviderStateMixin{
  static ProductDetailsController get to => Get.find();
  RxList<String> tabTiles = ['About', 'More Service', 'Review'].obs;
  RxInt currentIndex = 0.obs;  Rx<PageController>? pageController ;
  RxInt currentPage = 0.obs;
  Rx<TabController>? tabController;
  RxList<dynamic> bannerContent = [
AssetsConstant.megaDeals2,AssetsConstant.megaDeals1,AssetsConstant.megaDeals3  ].obs;
@override
  void onInit() {
  tabController = TabController(length: 3, vsync: this).obs;
  pageController== PageController(initialPage: 0).obs;
  tabController!.value.addListener(() {

    print("Current Tab Index: $currentIndex");
  });
  print('currentPage${currentPage}');
    super.onInit();
  }
}