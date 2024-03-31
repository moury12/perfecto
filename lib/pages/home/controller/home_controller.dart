import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mh_core/mh_core.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/controller/navigation_controller.dart';
import 'package:perfecto/models/home_model.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/outlets/oulet_page.dart';
import 'package:perfecto/services/home_service.dart';
import 'package:perfecto/utils.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  /// List of product list id [productListId]
  /// 6: Best Selling
  /// 16: Mega Deals
  /// 13: Super Deals
  /// 17: Personal Care
  ///
  final productListId = [
    '6',
    '16',
    '13',
    '17',
  ];
  final RxList<HomeModel> homeData = <HomeModel>[].obs;

  Rx<LoadingStatus> homeLoadingStatus = LoadingStatus.initial.obs;

  Rx<PageController> pageController = PageController().obs;
  Rx<int> currentPage = 0.obs;
  // List<String> bannerContent = [AssetsConstant.slider1, AssetsConstant.slider2, AssetsConstant.verticalBannner];

  @override
  void onClose() {
    pageController.value.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    getHomeCall();
    // TODO: implement onInit
    super.onInit();
  }

  Timer? _timer;
  startBannerAutoScroll(List<String> bannerContent) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 5000), (timer) {
      try {
        if (NavigationController.to.selectedIndex.value == 0) {
          if (currentPage < (bannerContent.length - 1)) {
            pageController.value.nextPage(duration: Duration(milliseconds: 2000), curve: Curves.ease);
          } else {
            pageController.value.animateToPage(0, duration: Duration(milliseconds: 2000), curve: Curves.ease);
          }
        }
      } catch (e) {
        globalLogger.e(e);
      }
    });
  }

  // get home data
  Future<void> getHomeCall() async {
    homeLoadingStatus.value = LoadingStatus.loading;
    homeData.value = [];
    try {
      homeData.value = await HomeService.homeCall();
      homeLoadingStatus.value = LoadingStatus.loaded;
    } catch (e) {
      homeLoadingStatus.value = LoadingStatus.error;
      globalLogger.e(e);
    }
    update();
  }
}
