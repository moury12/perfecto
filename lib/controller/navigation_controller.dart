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
  RxBool isReset = false.obs;
  RxList<AttributeModel> attributeList = <AttributeModel>[].obs;
  RxList<SortModel> sortList = <SortModel>[].obs;

  RxMap<dynamic, dynamic> addAttribute = {}.obs;
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

  void resetFilters() {
    attributeList.forEach((attribute) {
      attribute.isSelected = false;
      attribute.attributes.forEach((attributes) {
        attributes.filtered = false;
      });
    });

    HomeApiController.to.categoryList.forEach((category) {
      category.isExpanded = false;
      category.subcategory?.forEach((subcategory) {
        subcategory.isExpanded = false;
        subcategory.subcategory?.forEach((child) {
          child.isExpanded = false;
        });
      });
    });
    update();
    attributeList.refresh();
    HomeApiController.to.update();
    HomeApiController.to.categoryList.refresh();
  }

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

  void attributeListCall() {
    attributeList.value = <AttributeModel>[
      AttributeModel(
          name: 'Category',
          attributes: [],
          isSelected: true,
          keyName: 'category'),
      AttributeModel(
        keyName: 'brand',
        name: 'Brand',
        attributes: [],
      ),
      AttributeModel(
        keyName: 'max_min',
        name: 'Price',
        attributes: [],
      ),
      AttributeModel(
        keyName: '',
        name: 'Discount',
        attributes: [],
      ),
      AttributeModel(
        keyName: '',
        name: 'Avg Customer Rating',
        attributes: [],
      ),
      AttributeModel(
        keyName: 'preference',
        name: 'Preference',
        attributes: HomeApiController.to.preferenceList,
      ),
      AttributeModel(
        keyName: 'color',
        name: 'Color',
        attributes: HomeApiController.to.colorList,
      ),
      AttributeModel(
        keyName: 'country',
        name: 'Country Of Origin',
        attributes: HomeApiController.to.countryList,
      ),
      AttributeModel(
        keyName: 'finish',
        name: 'Finish',
        attributes: HomeApiController.to.finishList,
      ),
      AttributeModel(
        keyName: 'formulation',
        name: 'Formulation',
        attributes: HomeApiController.to.formulationList,
      ),
      AttributeModel(
        keyName: 'gender',
        name: 'Gender',
        attributes: HomeApiController.to.genderList,
      ),
      AttributeModel(
        keyName: 'benefit',
        name: 'Benefits',
        attributes: HomeApiController.to.benefitList,
      ),
      AttributeModel(
        keyName: 'packSize',
        name: 'Pack Size',
        attributes: HomeApiController.to.packSizeList,
      ),
      AttributeModel(
        keyName: 'skinType',
        name: 'Skin Type',
        attributes: HomeApiController.to.skinTypeList,
      ),
      AttributeModel(
        keyName: 'coverage',
        name: 'Coverage',
        attributes: HomeApiController.to.coverageList,
      ),
      AttributeModel(
        keyName: 'concern',
        name: 'Concern',
        attributes: HomeApiController.to.concernList,
      ),
    ];
    sortList.value = <SortModel>[
      SortModel(name: 'Relevance', isSelected: true),
      SortModel(
          name: 'Price - High to Low',
          isSelected: true,
          keyName: 'sort_by_price'),
      SortModel(
          name: 'Price - Low to High',
          isSelected: true,
          keyName: 'sort_by_price'),
    ];
  }
}
