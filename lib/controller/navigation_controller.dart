import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/controller/auth_controller.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/main.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/pages/auth/login_page.dart';

import '../DB/database_helper.dart';
import '../constants/assets_constants.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  var selectedIndex = 0.obs;
  RxBool openSearchResult = false.obs;
  RxBool checked = false.obs;
  RxBool checked2 = false.obs;
  RxList<AttributeModel> attributeList = <AttributeModel>[
    AttributeModel(
      name: 'Category',
      attributes: [],
      isSelected: true
    ), AttributeModel(
      name: 'Price',
      attributes: [],
    ),
    AttributeModel(
      name: 'Discount',
      attributes: [],
    ),
    AttributeModel(
      name: 'Avg Customer Rating',
      attributes: [],
    ),
    AttributeModel(
      name: 'Preference',
      attributes: HomeApiController.to.preferenceList,
    ),
    AttributeModel(
      name: 'Color',
      attributes: [],
    ),
    AttributeModel(
      name: 'Country Of Origin',
      attributes: HomeApiController.to.countryList,
    ),
    AttributeModel(
      name: 'Finish',
      attributes: HomeApiController.to.finishList,
    ),
    AttributeModel(
      name: 'Formulation',
      attributes: HomeApiController.to.formulationList,
    ),
    AttributeModel(
      name: 'Gender',
      attributes: HomeApiController.to.genderList,
    ),
    AttributeModel(
      name: 'Benefits',
      attributes: HomeApiController.to.benefitList,
    ),
    AttributeModel(
      name: 'Pack Size',
      attributes: HomeApiController.to.packSizeList,
    ),
    AttributeModel(
      name: 'Skin Type',
      attributes: HomeApiController.to.skinTypeList,
    ),
    AttributeModel(
      name: 'Skin Tone',
      attributes: [],
    ),
    AttributeModel(
      name: 'Coverage',
      attributes: HomeApiController.to.coverageList,
    ),
    AttributeModel(
      name: 'Concern',
      attributes: HomeApiController.to.concernList,
    ),
  ].obs;
  RxList<dynamic> navList = [
    {'title': 'Home', 'icon': AssetsConstant.navIcon1},
    {'title': 'Category', 'icon': AssetsConstant.navIcon2},
    {'title': 'Chat', 'icon': AssetsConstant.navIcon3},
    {'title': 'Account', 'icon': AssetsConstant.navIcon4},
  ].obs;
  void changeTabIndex(int index) {
    if ((index == 2 || index == 3) && !AuthController.to.isLoggedIn.value) {
      loginRoute(index);
    } else {
      selectedIndex.value = index;
    }
  }

  void loginRoute(int index) {
    AuthController.to.unAuthenticateIndex(index);
    Get.toNamed(LoginScreen.routeName);
  }

  // RxBool isLogin() {
  //   final dbHelper = DatabaseHelper();
  //   final user = dbHelper.getUser();
  //   if (user != null) {
  //     return true.obs;
  //   } else {
  //     return false.obs;
  //   }
  // }

  RxBool openSearchSuggestion = true.obs;
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
