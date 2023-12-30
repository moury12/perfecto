import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';

import '../constants/assets_constants.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  var selectedIndex = 0.obs;
  RxBool openSearchResult = false.obs;
  RxBool checked = false.obs;
  RxBool checked2 = false.obs;
  RxList<dynamic> navList = [
    {'title': 'Home', 'icon': AssetsConstant.navIcon1},
    {'title': 'Category', 'icon': AssetsConstant.navIcon2},
    {'title': 'Chat', 'icon': AssetsConstant.navIcon3},
    {'title': 'Account', 'icon': AssetsConstant.navIcon4},
  ].obs;
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxBool isSearchFieldNotEmpty = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    searchController.value.dispose();
    globalLogger.d("searchController dispose");
    super.onClose();
  }
}
