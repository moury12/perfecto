import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:perfecto/main.dart';

import '../DB/database_helper.dart';
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
    if (index == 3) {
      _insert();
    }
    if (index == 2) {
      _delete('5');
    }
  }

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.userId: '5',
      DatabaseHelper.isLogIn: 0,
      DatabaseHelper.updatedAt: DateTime.now().millisecondsSinceEpoch,
      DatabaseHelper.createdAt: DateTime.now().millisecondsSinceEpoch
    };
    final id = await dbHelper.insert(row);
    globalLogger.d('inserted row id: $id');
  }

  void _delete(dynamic userId) async {
    // Assuming that the number of rows is the id for the last row.
    // final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(DatabaseHelper.userId, userId);
    globalLogger.d('deleted $rowsDeleted row(s): User $userId');
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
}
